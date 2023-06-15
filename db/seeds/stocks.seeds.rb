
after :segments, :countries, :assets do
  segment = Api::V1::Segment.find_by(name: "Bancos")
  country = Api::V1::Country.find_by(name: "Brasil")
  asset = Api::V1::Asset.find_by(name: "Ação")

  [
    {
      icon: "/acao/BBSE.gif",
      name: "Banco do Brasil",
      description: "Instituição bicentenária e um dos maiores bancos do Brasil em total de ativos.",
      acronym: "BBAS",
      stock_type: "ordinary",
      cnpj: "00000000000191",
      isin: "BRBBASACNOR3",
      code_cvm: "1023"
      segment: segment,
      country: country,
      asset: asset
    },
    {
      icon: "/acao/BBSE.gif",
      name: "Banco do Brasil",
      description: "Instituição bicentenária e um dos maiores bancos do Brasil em total de ativos.",
      acronym: "BBAS",
      stock_type: "bdr_etf_unit",
      cnpj: "00000000000191",
      isin: "BRBBASA04OR8",
      code_cvm: "1023"
      segment: segment,
      country: country,
      asset: asset
    },
  ].each { |params| Api::V1::Stock.find_or_create_by(params) }
end
