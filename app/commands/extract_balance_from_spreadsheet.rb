class ExtractBalanceFromSpreadsheet < Actor
  input :spreadsheet
  input :stocks
  output :stocks

  def call
    balance = spreadsheet.sheet("Acoes").column(14)
    balance.shift()

    balance.each_index do |i|
      stock = stocks[i]
      if stock
        stocks[i][:balance] = balance[i]
      else
        stocks[i] = { balance: balance[i] }
      end
    end
  end
end
