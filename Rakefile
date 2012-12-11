require 'engineering'

require_relative 'firstfloor'
require_relative 'thirdfloor'

model :House do
    push FirstFloor.new
end

task :default do
    DXF.write('ThirdFloorplan.dxf', ThirdFloorplanSketch.new)
end

task :sketchup do
    SketchUp.write('House.su', House.new)
end