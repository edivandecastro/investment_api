class ExtractAmountFromSpreadsheet < Actor
  input :spreadsheet
  input :stocks
  output :stocks

  def call
    amount = spreadsheet.sheet("Acoes").column(9)
    amount.shift()

    amount.each_index do |i|
      stock = stocks[i]
      if stock
        stocks[i][:amount] = amount[i]
      else
        stocks[i] = { amount: amount[i] }
      end
    end
  end
end
