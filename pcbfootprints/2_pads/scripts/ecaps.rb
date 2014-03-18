require 'geda_footprint'
include GedaFootprint


# 10 mm dia polarized capacitor.

e = SmdTwoPad.new({ :pad_length => Unit("4.0 mm"),
                    :pad_thickness => Unit("1.7 mm"),
                    :pad_separation => Unit("4.2 mm"),
                    :width => Unit("12 mm"),
                    :height => Unit("12 mm"),
                    :pad_anchor => :end,
                    :polarized_pin => 1})

Renderer.new.render_to_file(e, "../smd_ecap_10mm_dia.fp")
