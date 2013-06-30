require 'engineering'

WALL_HEIGHT = 108.5.inch
BATHROOM_WALL_HEIGHT = 101.inch
KITCHEN_WALL_HEIGHT = 95.inch
MIDLEVEL_WALL_HEIGHT = 86.5.inches
WALL_THICKNESS = 6.inch

X = Vector[1,0,0]
Y = Vector[0,1,0]
Z = Vector[0,0,1]

bedroomA = Polygon.build do
    start_at	[-45.125.inch, -60.875.inch]
    up		176.285.inch
    right	15.25.inch
    up		88.25.inch
    left	121.5.inch
    down	62.66.inch
    right	68.375.inch
    down	45.125.inch
    left	106.5.inch
    down	156.75.inch
end

bedroomA_bathroom = Polygon.build do
    start_at	[-88.125.inch, 101.215.inch]
    up		35.inch
    left	63.5.inch
    down	35.inch
end

bedroomA_closet = Polygon.build do
    start_at	[-25.75.inch, 115.75.inch]
    right	39.inch
    up		16.5.inch
    right	16.5.inch
    up		71.5.inch
    left	55.5.inch
end

bedroomB = Polygon.build do
    start_at	[16.625.inch, -16.5.inch]
    right	140.25.inch
    up		18.inch
    right	19.875.inch
    up		109.25.inch
    left	160.125.inch
end

bedroomB_bathroom = Polygon.build do
    start_at	[34.25.inch, 115.75.inch]
    right	34.5.inch
    up		28.75.inch
    right	62.25.inch
    up		58.75.inch
    left	96.75.inch
end

bedroomB_closet = Polygon.build do
    start_at	[73.75.inch, 115.75.inch]
    right	103.inch
    up		23.25.inch
    left	103.inch
end

hallway = Polygon.build do
    start_at	[-40.125.inch, -60.785.inch]
    right	197.249.inch
    up		38.285.inch
    left	145.374.inch
    up		133.25.inch
    left	51.875.inch
end

rooms = [bedroomA, bedroomA_bathroom, bedroomA_closet, hallway, bedroomB, bedroomB_bathroom, bedroomB_closet]
outset_rooms = rooms.map {|p| p.outset WALL_THICKNESS }

model :ThirdFloor do
    extrude length:WALL_HEIGHT do
        push outset_rooms.reduce(:+)
        rooms.each {|r| push r}
    end

    # The ledge at the top of the stairs
    extrude length:37.inch do
	polygon do
	    start_at    	[0.inch, -22.5.inch]
	    move_y	    	(15+22.5).inch
	    move_x	    	11.75.inch
	    move_y		-(15+22.5).inch
	end
    end

    door_height = 80.inch

    # Master bedroom modifications
    group do
    	master_bathroom_window_width = 22.875.inch
    	master_bathroom_window_height = 23.inch

	# The drop ceiling in the bathroom
	extrude length:8.75.inch, :origin => [0,0, WALL_HEIGHT] do
	    polygon do
		start_at    [-45.125.inch, 95.875.inch]
                up          19.535.inch
                right	    15.25.inch
                up	    88.25.inch
                left	    121.5.inch
                down	    62.66.inch
                right	    68.375.inch
                down	    45.125.inch
	    end
	end

	# In the WC
	xextrude length:8.75.inch, :origin => [0,0, WALL_HEIGHT] do
            rectangle [-151.625.inch, 101.215.inch], Size[63.5.inch, 35.inch]
	end

        # Cutout for the door into the bedroom
        extrude length:5.inch, :origin => [-40.125.inch, 23.175.inch], :x => Y, :y => Z do
            rectangle [0,0], [59.291.inch, 81.inch]
        end

        # Cutout for the door into the WC
        extrude length:5.125.inch, :origin => [-83.inch, 104.465.inch], :x => Y, :y => Z do
            rectangle [0,0], [28.5.inch, door_height]
        end

        # Cutout for the closet door
        extrude length:4.125.inch, :origin => [-25.75.inch, 141.inch], :x => Y, :y => Z do
            rectangle [0,0], [31.75.inch, door_height]
        end

	# Master bedroom large window
	extrude length:WALL_THICKNESS, :origin => [-189.5.inch, (29.215).inch, 38.25.inch], :x => Y, :y => Z do
	    rectangle [0,0], [59.inch, 58.25.inch]
	end

	# Shower windows
	extrude length:WALL_THICKNESS, :origin => [-151.375.inch, (141+5.5).inch, (WALL_HEIGHT-4.inch-master_bathroom_window_height-8.75.inch)], :x => Y, :y => Z do
	    rectangle [0,0], [master_bathroom_window_width, master_bathroom_window_height]
	end
	extrude length:WALL_THICKNESS, :origin => [-151.375.inch, (141+5.5+master_bathroom_window_width+6.75).inch, (WALL_HEIGHT-4.inch-master_bathroom_window_height-8.75.inch)], :x => Y, :y => Z do
	    rectangle [0,0], [master_bathroom_window_width, master_bathroom_window_height]
	end
    end

    # Other master bedroom modifications
    group do
    	bathroom_window_height = 23.inch
        wall_thickness = 5.inch

        # Cutout for the door into the bedroom
        extrude length:4.875.inch, :origin => [11.75.inch, 54.inch], :x => Y, :y => Z do
            rectangle [0,0], [30.inch, door_height]
        end

    	# Cutout for the door into the bathroom
    	extrude length:wall_thickness, :origin => [36.625.inch, 110.75.inch], :x => X, :y => Z do
    	    rectangle [0,0], [29.75.inch, door_height]
    	end

    	# Cutout for the closet door
    	extrude length:wall_thickness, :origin => [80.375.inch, 110.75.inch], :x => X, :y => Z do
    	    rectangle [0,0], [82.625.inch, door_height]
    	end

    	# Large window
    	extrude length:WALL_THICKNESS, :origin => [176.75.inch, (1.5+39.375).inch, 38.25.inch], :x => Y, :y => Z do
    	    rectangle [0,0], [58.75.inch, 58.25.inch]
    	end

    	# Bathroom window
    	extrude length:WALL_THICKNESS, :origin => [131.inch, (144.5+17.5).inch, WALL_HEIGHT-3.75.inch-bathroom_window_height], :x => Y, :y => Z do
    	    rectangle [0,0], [22.75.inch, bathroom_window_height]
    	end
    end
end
