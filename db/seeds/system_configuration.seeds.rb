[
  {
    settings: {
      spreadsheet: {
        stock: {
          code: 'Código de Negociação',
          amount: 'Quantidade',
          balance: 'Valor Atualizado'
        }
      }
    }
  },
].each { |params| SystemConfiguration.find_or_create_by(params) }
