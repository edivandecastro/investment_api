[
  { name: "Ação", description: "Ações da bolsa de valores" },
  { name: "FII", description: "Fundo de Investimento Imobiliário" },
].each { |params| Api::V1::Asset.find_or_create_by(params) }
