require 'ruby-units'

Unit.define("zil") do |zil|
  zil.definition = Unit('1/100 mil')
  zil.aliases = %w{zil}
  zil.display_name = "Zil"
end
