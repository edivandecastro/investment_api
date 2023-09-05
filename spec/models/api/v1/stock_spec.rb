require 'rails_helper'

RSpec.describe Api::V1::Stock, type: :model do
  it "factory" do
    expect(FactoryBot.build(:stock)).to be_valid
  end

  context "columns" do
    it { is_expected.to have_db_column(:icon).of_type(:string) }
    it { is_expected.to have_db_column(:ticker_symbol).of_type(:string) }
    it { is_expected.to have_db_column(:stock_type).of_type(:integer) }
    it { is_expected.to have_db_column(:isin).of_type(:string) }
    it { is_expected.to have_db_column(:company_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:asset_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:ticker_symbol) }
    it { is_expected.to validate_presence_of(:stock_type) }
  end
end
