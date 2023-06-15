class CalculateAmountStocks < Actor
  input :document
  output :stocks
  output :spreadsheet

  def call
    self.spreadsheet = Roo::Spreadsheet.open(document)

    rows = self.spreadsheet.sheet("Acoes").column(4)
    rows.shift()
    amount_stock = rows.size
    self.stocks = Array.new(amount_stock)
  end
end
