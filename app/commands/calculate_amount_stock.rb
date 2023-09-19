class CalculateAmountStock < Actor
  input :document
  input :user_id
  output :stocks
  output :spreadsheet

  def call
    self.spreadsheet = Api::V1::Spreadsheet::Stock.new(document: document)
    self.stocks = Array.new(spreadsheet.amount_stock) { Hash.new }
  rescue RangeError
    fail!(error: I18n.t('comand.errors.sheet_stock_not_found'))
  end
end
