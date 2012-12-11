require 'engineering'

WALL_HEIGHT = 108.5.inch
BATHROOM_WALL_HEIGHT = 101.inch
KITCHEN_WALL_HEIGHT = 95.inch
MIDLEVEL_WALL_HEIGHT = 86.5.inches
WALL_THICKNESS = 6.inch

X = Vector[1,0,0]
Y = Vector[0,1,0]
Z = Vector[0,0,1]

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

sketch :InnerWallSketch do
    polygon do
	start_at    	[11.75.inch, -22.5.inch]
	move_y		(39+37.5).inch
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
	move_y		-84.5.inch
	move_x		216.875.inch
	move_y		38.285.inch
    end
end

sketch :OuterWallSketch do
    inner_wall = InnerWallSketch.new.elements.first
    push inner_wall.outset(6.inch)

end

model :ThirdFloor do
    extrude WALL_HEIGHT do
	inner_wall = InnerWallSketch.new.elements.first
	outer_wall = inner_wall.outset(WALL_THICKNESS)
	push outer_wall
	push inner_wall
    end

    # The ledge at the top of the stairs
    extrude 37.inch do
	polygon do
	    start_at    	[0.inch, -22.5.inch]
	    move_y	    	(15+22.5).inch
	    move_x	    	11.75.inch
	    move_y		-(15+22.5).inch
	end
    end

    # Master bedroom modifications
    group do
    	master_bathroom_window_width = 22.875.inch
    	master_bathroom_window_height = 23.inch

	# The drop ceiling in the master bathroom
	extrude 8.75.inch, :origin => [0,0, WALL_HEIGHT-8.75.inch] do
	    polygon do
		start_at	[-83.375, 95.965.inch]
		move_x	-68.375.inch
		move_y	62.66.inch + 45.125.inch
		move_x	121.5.inch
		move_y	-88.251.inch
		move_x	-15.25.inch
		move_y	-19.535.inch
	    end
	end

	# Master bedroom large window
	extrude WALL_THICKNESS, :origin => [-189.875.inch, (95.965-7.75).inch, 38.25.inch], :x => -Y, :y => Z do
	    rectangle [0,0], [59.inch, 58.25.inch]
	end

	# Shower windows
	extrude WALL_THICKNESS, :origin => [-151.75.inch, (141+5.5+master_bathroom_window_width).inch, (WALL_HEIGHT-4.inch-master_bathroom_window_height-8.75.inch)], :x => -Y, :y => Z do
	    rectangle [0,0], [master_bathroom_window_width, master_bathroom_window_height]
	end
	extrude WALL_THICKNESS, :origin => [-151.75.inch, (141+5.5+2*master_bathroom_window_width+6.75).inch, (WALL_HEIGHT-4.inch-master_bathroom_window_height-8.75.inch)], :x => -Y, :y => Z do
	    rectangle [0,0], [master_bathroom_window_width, master_bathroom_window_height]
	end
    end

    # Other master bedroom modifications
    group do
    	bathroom_window_height = 23.inch

    	# Large window
    	extrude WALL_THICKNESS, :origin => [176.75.inch, (1.5+39.375).inch, 38.25.inch], :x => Y, :y => Z do
    	    rectangle [0,0], [58.75.inch, 58.25.inch]
    	end

    	# Bathroom window
    	extrude WALL_THICKNESS, :origin => [131.inch, (144.5+17.5).inch, WALL_HEIGHT-3.75.inch-bathroom_window_height], :x => Y, :y => Z do
    	    rectangle [0,0], [22.75.inch, bathroom_window_height]
    	end
    end
end