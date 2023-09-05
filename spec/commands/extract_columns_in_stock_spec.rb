require 'rails_helper'

RSpec.describe ExtractColumnsInStock, type: :model do
  let!(:system_configuration) { create(:system_configuration) }
  let(:spreadsheet) { Api::V1::Spreadsheet::Stock.new(document: document) }
  let(:stocks) { [{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}] }

  describe ".call" do
    context "when have all columns for stock" do
      let(:document) do
        Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'position.xlsx'))
      end

      it "should return stocks with array of hash" do
        context = ExtractColumnsInStock.call(spreadsheet: spreadsheet, user_id: 1, stocks: stocks)
        expect(context.stocks).to eq result
      end
    end

    context "when not have column code for stock" do
      let(:document) do
        Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'position-fail-column.xlsx'))
      end

      it "should raise message of error ServiceActor::Failure" do
        message = I18n.t('comand.errors.spredsheet_column_not_found', name: 'Código de Negociação')
        expect {
          ExtractColumnsInStock.call(spreadsheet: spreadsheet, user_id: 1, stocks: stocks)
        }.to raise_error(ServiceActor::Failure, message)
      end
    end
  end

  def result
    [
      {:amount=>100, :balance=>90.0, :code=>"ABEV3"},
      {:amount=>100, :balance=>1234.7, :code=>"AZUL4"},
      {:amount=>600, :balance=>7926.0, :code=>"B3SA3"},
      {:amount=>200, :balance=>1040.0, :code=>"CIEL3"},
      {:amount=>200, :balance=>528.0, :code=>"COGN3"},
      {:amount=>100, :balance=>4221.0, :code=>"EGIE3"},
      {:amount=>100, :balance=>2278.0, :code=>"ENBR3"},
      {:amount=>115, :balance=>1024.65, :code=>"ITSA4"},
      {:amount=>100, :balance=>100.0, :code=>"ITUB3"},
      {:amount=>500, :balance=>1830.0, :code=>"MGLU3"},
      {:amount=>100, :balance=>50.0, :code=>"PSSA3"},
      {:amount=>208, :balance=>250.79, :code=>"RADL3"},
      {:amount=>400, :balance=>3936.0, :code=>"STBP3"},
      {:amount=>500, :balance=>1235.65, :code=>"TAEE3"},
      {:amount=>100, :balance=>2440.0, :code=>"VIVA3"},
      {:amount=>700, :balance=>10000.0, :code=>"WEGE3"},
      {:amount=>100, :balance=>5000.0, :code=>"YDUQ3"}
    ]
  end
end
