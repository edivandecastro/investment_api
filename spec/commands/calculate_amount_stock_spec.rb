require 'rails_helper'

RSpec.describe CalculateAmountStock, type: :model do
  let(:document) do
    Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'position.xlsx'))
  end

  describe ".call" do
    it "should return stocks with array of hash" do
      context = CalculateAmountStock.call(document: document, user_id: 1)
      expect(context.stocks).to eq [{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}]
    end

    it "should return spreadsheet" do
      context = CalculateAmountStock.call(document: document, user_id: 1)
      expect(context.spreadsheet).to be_a Api::V1::Spreadsheet::Stock
    end

    context "when not have sheet for stock" do
      let(:document) do
        Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'position-fail-sheet.xlsx'))
      end

      it "should raise message of error ServiceActor::Failure" do
        expect {
          CalculateAmountStock.call(document: document, user_id: 1)
        }.to raise_error(ServiceActor::Failure, I18n.t('comand.errors.sheet_stock_not_found'))
      end
    end
  end
end
