FactoryBot.define do
  factory :system_configuration do
    settings do
      {
        spreadsheet: {
          stock: {
            code: 'Código de Negociação',
            amount: 'Quantidade',
            balance: 'Valor Atualizado'
          }
        }
      }
    end
  end
end
