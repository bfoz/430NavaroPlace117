require 'rake/clean'
require 'engineering'

BUILD_DIR = 'build'

CLEAN.include(BUILD_DIR)

directory BUILD_DIR

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

task :default => BUILD_DIR do
    DXF.write(File.join(BUILD_DIR,'FirstFloor.dxf'), FirstFloorSketch.new)
    DXF.write(File.join(BUILD_DIR,'ThirdFloorplan.dxf'), ThirdFloorplanSketch.new)
end

task :sketchup => BUILD_DIR do
    SketchUp.write(File.join(BUILD_DIR,'House.su'), House.new)
    SketchUp.write(File.join(BUILD_DIR,'FirstFloor.su'), FirstFloor.new)
    SketchUp.write(File.join(BUILD_DIR,'ThirdFloor.su'), ThirdFloor.new)
end
