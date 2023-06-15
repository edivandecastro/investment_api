class ExtractCodesFromSpreadsheet < Actor
  input :spreadsheet
  input :stocks
  output :stocks

  def call
    codes = spreadsheet.sheet("Acoes").column(4)
    codes.shift()

    codes.each_index do |i|
      stock = stocks[i]
      if stock
        stocks[i][:code] = codes[i]
      else
        stocks[i] = { code: codes[i] }
      end
    end
  end
end
