require 'rails_helper'

RSpec.describe Api::V1::UserAsset, type: :model do
  it "factory" do
    expect(FactoryBot.build(:user_asset)).to be_valid
  end

  context "columns" do
    it { is_expected.to have_db_column(:user_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:investible_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:investible_type).of_type(:string) }
    it { is_expected.to have_db_column(:balance).of_type(:decimal) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:balance) }
  end
end
