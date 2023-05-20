require 'rails_helper'

RSpec.describe Api::V1::User, type: :model do
  it "factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  context "columns" do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:password).of_type(:string) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
