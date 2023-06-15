class ImportPositionInStock < Actor
  play CalculateAmountStocks,
       ExtractCodesFromSpreadsheet,
       ExtractAmountFromSpreadsheet,
       ExtractBalanceFromSpreadsheet
end
