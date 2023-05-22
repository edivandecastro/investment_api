[
  { name: "Brasil", locale: "pt-BR", acronym: "BRA" },
  { name: "Estados Unidos", locale: "en", acronym: "USA" },
].each { |params| Api::V1::Country.find_or_create_by(params) }
