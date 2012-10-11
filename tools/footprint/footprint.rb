require 'ruby-units'

require_relative 'lib/attr'
require_relative 'lib/units'
require_relative 'lib/quoted.rb'
require_relative 'lib/helper'

require_relative 'pcb-element'
require_relative 'renderer'
require_relative 'position'
require_relative 'element'
require_relative 'pad'
require_relative 'pad-line'
require_relative 'pin'
require_relative 'line'
require_relative 'arc'
require_relative 'quad-package.rb'


renderer = Renderer.new
e = QuadPackage.new

renderer.render(e)


puts renderer.rendered_element
