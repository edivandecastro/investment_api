class ExtractColumnsInStock < Actor
  input :spreadsheet
  input :user_id
  input :stocks
  output :stocks

  def call
    stocks.each_index do |i|
      stocks[i].store(:code, column(:code, i))
      stocks[i].store(:balance, column(:balance, i))
      stocks[i].store(:amount, column(:amount, i))
    end
  rescue Errors::NotFoundColumnError => e
    fail!(error: e.message)
  end

  private

  def column(name, position)
    spreadsheet.column(name)[position]
  end
end
