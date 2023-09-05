require 'rails_helper'

RSpec.describe Api::V1::Spreadsheet::Stock, type: :model do
  subject { Api::V1::Spreadsheet::Stock.new(document: document) }

  let(:document) do
    Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'position.xlsx'))
  end

  describe "#column" do
    let!(:system_configuration) { create(:system_configuration) }

    context "when get codes" do
      it "should return columns of codes in spreadsheet" do
        expect(subject.column(:code)).to eq column_code
      end
    end

    context "when get balances" do
      it "should return columns of balances in spreadsheet" do
        expect(subject.column(:balance)).to eq column_balance
      end
    end

    context "when get amounts" do
      it "should return columns of amounts in spreadsheet" do
        expect(subject.column(:amount)).to eq column_amount
      end
    end
  end

  def column_code
    [
      "ABEV3",
      "AZUL4",
      "B3SA3",
      "CIEL3",
      "COGN3",
      "EGIE3",
      "ENBR3",
      "ITSA4",
      "ITUB3",
      "MGLU3",
      "PSSA3",
      "RADL3",
      "STBP3",
      "TAEE3",
      "VIVA3",
      "WEGE3",
      "YDUQ3"
    ]
  end

  def column_balance
    [
      90.0,
      1234.7,
      7926.0,
      1040.0,
      528.0,
      4221.0,
      2278.0,
      1024.65,
      100.0,
      1830.0,
      50.0,
      250.79,
      3936.0,
      1235.65,
      2440.0,
      10000.0,
      5000.0
    ]
  end

  def column_amount
    [
      100,
      100,
      600,
      200,
      200,
      100,
      100,
      115,
      100,
      500,
      100,
      208,
      400,
      500,
      100,
      700,
      100
    ]
  end
end
