require 'rails_helper'

RSpec.describe Api::V1::Transaction, type: :model do
  it "factory" do
    expect(FactoryBot.build(:transaction)).to be_valid
  end

  context "columns" do
    it { is_expected.to have_db_column(:operation_type).of_type(:integer) }
    it { is_expected.to have_db_column(:trading_date).of_type(:date) }
    it { is_expected.to have_db_column(:quantity).of_type(:decimal) }
    it { is_expected.to have_db_column(:unit_value).of_type(:decimal) }
    it { is_expected.to have_db_column(:user_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:investible_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:investible_type).of_type(:string) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:operation_type) }
    it { is_expected.to validate_presence_of(:trading_date) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:unit_value) }
  end
end
