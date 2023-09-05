class ExtractColumnsInStock < Actor
  input :spreadsheet
  input :user_id
  input :stocks
  output :stocks

  def call
    begin
      stocks.each_index do |i|
        stocks[i].store(:code, spreadsheet.column(:code).dig(i))
        stocks[i].store(:balance, spreadsheet.column(:balance).dig(i))
        stocks[i].store(:amount, spreadsheet.column(:amount).dig(i))
      end
    rescue Errors::NotFoundColumnError => e
      fail!(error: e.message)
    end
  end
end
