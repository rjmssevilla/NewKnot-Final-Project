require 'rails_helper'

RSpec.describe Supplier, type: :model do
  context "validation tests" do

    let(:supplier) {build(:supplier)}

    it '1. ensures first name presence' do
      supplier.first_name = nil

      expect(supplier).to_not be_valid
      expect(supplier.errors).to be_present
      expect(supplier).to_not be_valid
    end

    it '2. ensures last name presence' do
      supplier.last_name = nil

      expect(supplier).to_not be_valid
      expect(supplier.errors).to be_present
      expect(supplier).to_not be_valid
   end

    it '3. ensures contact number presence' do
      supplier.contact_number = nil

      expect(supplier).to_not be_valid
      expect(supplier.errors).to be_present
      expect(supplier).to_not be_valid
  end

    it '4. ensures contact number does not include a letter' do
      supplier.contact_number = '92931231ASA2'

      expect(supplier).to_not be_valid
      expect(supplier.errors).to be_present
      expect(supplier).to_not be_valid
    end

    it '5. ensures contact number field is a minimum of 10' do
      supplier.contact_number = '123'

      expect(supplier).to_not be_valid
      expect(supplier.errors).to be_present
      expect(supplier).to_not be_valid
    end

    it '6. ensures company name presence' do
      supplier.company_name = nil

      expect(supplier).to_not be_valid
      expect(supplier.errors).to be_present
      expect(supplier).to_not be_valid
    end
  end
end