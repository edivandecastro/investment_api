require 'rails_helper'

RSpec.describe Api::V1::Country, type: :model do
  it "factory" do
    expect(FactoryBot.build(:country)).to be_valid
  end

  context "columns" do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:locale).of_type(:string) }
    it { is_expected.to have_db_column(:acronym).of_type(:string) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:locale) }
    it { is_expected.to validate_presence_of(:acronym) }
  end
end
