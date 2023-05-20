require 'rails_helper'

RSpec.describe Api::V1::Segment, type: :model do
  it "factory" do
    expect(FactoryBot.build(:segment)).to be_valid
  end

  context "columns" do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
