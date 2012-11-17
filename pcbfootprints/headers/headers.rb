require 'geda_footprint'
include GedaFootprint

pitch_100mil = {
  pin_diameter: Unit('1.8 mm'),
  drill_diameter: Unit('0.85 mm'),
  pitch: Unit('100 mil'),
  pin_rect: Rectangle.new(width: Unit('100 mil'))
}

sizes = {
  header_6pin_100mil: pitch_100mil.merge(number_of_pins: 6),
  header_2pin_100mil: pitch_100mil.merge(number_of_pins: 2)
}

sizes.each do |key, hash|
  file = "#{key.to_s}.fp"
  Renderer.new.render_to_file(Header.new(hash), file)
end
