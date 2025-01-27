class Supplier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :contact_number, presence: true, numericality: { only_integer: true }, length: { minimum: 10 }
  validates :company_name, presence: true

  has_many :services, dependent: :destroy

  after_create :send_supplier_email

  def send_supplier_email
    SupplierMailer.new_supplier_waiting_for_approval(self).deliver_later
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end
end
