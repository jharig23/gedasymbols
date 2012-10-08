require 'ruby-units'

require_relative 'lib/attr'
require_relative 'lib/units'
require_relative 'lib/helper'

require_relative 'renderer'
require_relative 'position'
require_relative 'element'

renderer = Renderer.new

e = Element.new

renderer.render(e)
puts "line = #{renderer.line}"
