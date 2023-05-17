require 'rails_helper'

RSpec.describe Api::V1::Asset, type: :model do
  it "factory" do
    expect(FactoryBot.build(:asset)).to be_valid
  end

  context "columns" do
    it { is_expected.to have_db_column(:icon).of_type(:string) }
    it { is_expected.to have_db_column(:codes).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:string) }
    it { is_expected.to have_db_column(:sector).of_type(:string) }
    it { is_expected.to have_db_column(:price).of_type(:decimal) }
    it { is_expected.to have_db_column(:country_id).of_type(:uuid) }
  end

  context 'Associations' do
    it { should belong_to(:country) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:icon) }
    it { is_expected.to validate_presence_of(:codes) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:sector) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:country) }
  end
end
