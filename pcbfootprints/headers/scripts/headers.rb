require 'geda_footprint'
include GedaFootprint

pitch_100mil = {
  pin_diameter: Unit('2.5 mm'),
  drill_diameter: Unit('0.85 mm'),
  pitch: Unit('100 mil'),
  pin_rect: Rectangle.new(width: Unit('100 mil'))
}

sizes = {
  header_1x6pin_100mil: pitch_100mil.merge(cols: 1, rows: 6),
  header_1x3pin_100mil: pitch_100mil.merge(cols: 1, rows: 3),
  header_1x4pin_100mil: pitch_100mil.merge(cols: 1, rows: 4),
  header_2x3pin_100mil: pitch_100mil.merge(cols: 2, rows: 3),
  header_2pin_100mil: pitch_100mil.merge(cols: 2, rows: 1),
  header_2x8pin_100mil: pitch_100mil.merge(cols: 2, rows: 4)
}

sizes.each do |key, hash|
  file = "../#{key.to_s}.fp"
  Renderer.new.render_to_file(Header.new(hash), file)
end
