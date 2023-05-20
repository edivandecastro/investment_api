require 'rails_helper'

RSpec.describe Api::V1::Stock, type: :model do
  it "factory" do
    expect(FactoryBot.build(:stock)).to be_valid
  end

  context "columns" do
    it { is_expected.to have_db_column(:icon).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:string) }
    it { is_expected.to have_db_column(:acronym).of_type(:string) }
    it { is_expected.to have_db_column(:stock_type).of_type(:integer) }
    it { is_expected.to have_db_column(:segment_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:country_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:asset_id).of_type(:uuid) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:acronym) }
    it { is_expected.to validate_presence_of(:stock_type) }
  end
end
