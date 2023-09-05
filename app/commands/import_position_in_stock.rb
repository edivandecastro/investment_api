class ImportPositionInStock < Actor
  play CalculateAmountStock,
       ExtractColumnsInStock,
       CreateOrUpdateStock
end
