require 'engineering'

sketch :ThirdFloorplanSketch do
    inner_wall = polygon do
    	start_at    	[0.inch,0.inch]
    	move_y	    	15.inch
    	move_x	    	11.75.inch
    	move_y		39.inch
    	move_x		4.875.inch	# Door jamb into Bedroom#2
    	move_y		-70.5.inch
    	move_x		140.25.inch
    	move_y		18.inch
    	move_x		19.875.inch
    	move_y		39.375.inch
    	move_y		58.75.inch	# Width of the window
    	move_y		11.125.inch
    	move_x		-13.75.inch
    	move_y		5.inch		# Door jamb into the closet
    	move_x		13.75.inch
    	move_y		23.25.inch
    	move_x		-103.inch	# Back wall of the closet
    	move_y		-23.25.inch
    	move_x		6.625.inch
    	move_y		-5.inch		# Door jamb out of the closet
    	move_x		-14.inch
    	move_y		5.inch		# Door jamb into Bedroom2's bathroom
    	move_x		2.375.inch
    	move_y		28.75.inch
    	move_x		62.25.inch
    	move_y		17.5.inch
     	move_y		22.75.inch	# Width of the bathroom window
     	move_y		18.5.inch
     	move_x		-96.75.inch
     	move_y		-87.5.inch
     	move_x		2.375.inch
     	move_y		-5.inch		# Door jamb out of Bedroom2's bathroom
     	move_x		-19.75.inch
     	move_y		-26.75.inch
     	move_x		-4.875.inch	# Door jamb out of Bedroom2
     	move_y		5.25.inch
     	move_y		21.5.inch	# Depth of shelf
     	move_x		-53.inch
     	move_y		-27.75.inch
     	move_x		-5.inch		# Door jamb into Bedroom1
    	move_y		32.5.inch
     	move_x		15.25.inch
     	move_y		25.5.inch
     	move_x		5.inch		# Door jamb into Bedroom1's closet
     	move_y		-25.25.inch
     	move_x		39.inch
     	move_y		16.5.inch
     	move_x		16.5.inch
     	move_y		71.5.inch
     	move_x		-55.inch
     	move_y		-31.inch
     	move_x		-5.inch		# Door jamb out of Bedroom1's closet
     	move_y		31.inch
     	move_x		-121.5.inch
     	move_y		-(4.75+22.785+6.75+22.875+5.5).inch	# The shower wall with the windows
     	move_x		68.375.inch
    	move_y		-8.125.inch
    	move_x		-4.75.inch	# Door jamb into Bedroom1's bathroom
    	move_y		3.25.inch
    	move_x		-63.5.inch
    	move_y		-35.inch
    	move_x		63.5.inch
    	move_y		3.25.inch
    	move_x		4.75.inch	# Door jamb out of Bedroom1's bathroom
    	move_y		-8.5.inch
    	move_x		-106.5.inch
    	move_y		-156.75.inch
    	move_x		144.75.inch
    	move_y		84.5.inch
    	move_x		5.inch		# Door jamb out of Bedroom1
	move_y		-23.7.inch
#    	move_x		41.25.inch	# Edge of the steps
#    	close
    end

    push inner_wall.outset(6.inch)	# Create the outer wall by outsetting the inner wall by 6 inches

end

model :ThirdFloor do
    extrude (8*12).inch, ThirdFloorplanSketch
end

task :default do
    DXF.write('ThirdFloorplan.dxf', ThirdFloorplanSketch.new)
end

task :sketchup do
    SketchUp.write('ThirdFloor.su', ThirdFloor.new)
end