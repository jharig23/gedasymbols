# Build a SMD with 2 pads
# for 2 pad resistor, we seem to be concerned more with the distance between the two pads,
# than anything else.

require 'geda_footprint'
include GedaFootprint

SMD_SIZES.each do |key, size_hash|
  Renderer.new.render_to_file(SmdTwoPad.new(size_hash), "smd_#{key.to_s}.fp")
  [1, 2].each do |pin|
    Renderer.new.render_to_file(SmdTwoPad.new(size_hash.merge(:polarized_pin => pin)), "smd_#{key.to_s}p#{pin}.fp")
  end
end
