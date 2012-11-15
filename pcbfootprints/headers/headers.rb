require 'geda_footprint'
include GedaFootprint

pitch_100mil = {
  pin_diameter: Unit('1.2 mm'),
  drill_diameter: Unit('0.8 mm'),
  pitch: Unit('100 mil'),
  pin_rect: Rectangle.new(width: Unit('100 mil'))
}

sizes = {
  header_6pin_100mil: pitch_100mil.merge(number_of_pins: 6),
  header_2pin_100mil: pitch_100mil.merge(number_of_pins: 2)
}

sizes.each do |key, hash|
  file = "#{key.to_s}.rb"
  Renderer.new.render_to_file(Header.new(hash), file)
end
