Gem::Specification.new do |spec|
  spec.name         = 'konduto-ruby'
  spec.version      = '2.0.0'
  spec.authors      = ['Gabriel Custodio', 'Jonathan Cardoso de Campos']
  spec.email        = [%(gcmartins93@gmail.com jonathancardosodecampos@gmail.com)]
  spec.homepage     = 'https://github.com/jonathan0211/konduto-ruby'
  spec.summary      = 'This project aims to help ruby users of konduto API by offering a easy to use interface'
  spec.description  = 'A wrapper for konduto antifraud API'

  spec.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  spec.require_path = 'lib'

  spec.license      = 'MIT'

  spec.add_development_dependency 'factory_girl', '~> 4.7'
end
