class RemoveSupplierAndAddServiceId < ActiveRecord::Migration[6.0]
  def self.up
    add_column :buyer_services, :service_id, :integer
    add_index :buyer_services, :service_id
    remove_column :buyer_services, :supplier_id
  end

  def self.down
    remove_column :buyer_services, :service_id
    remove_index :buyer_services, :service_id
    add_column :buyer_services, :supplier_id, :integer
  end
end
