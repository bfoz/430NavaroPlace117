require 'engineering'

require_relative 'firstfloor'
require_relative 'thirdfloor'

first_floor_height = (95.5+4.25).inch
floor_spacing = 8.inch

model :House do
    push FirstFloor.new
    group :origin => [-3.489.inch, 153.47.inch, first_floor_height + floor_spacing], :x => -Y,  :y => X do
        push ThirdFloor.new
    end
end

task :default do
    DXF.write('FirstFloor.dxf', FirstFloorSketch.new)
    DXF.write('ThirdFloorplan.dxf', ThirdFloorplanSketch.new)
end

task :sketchup do
    SketchUp.write('House.su', House.new)
    SketchUp.write('FirstFloor.su', FirstFloor.new)
    SketchUp.write('ThirdFloor.su', ThirdFloor.new)
end