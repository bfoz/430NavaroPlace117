require 'engineering'

X = Vector[1,0,0]
Y = Vector[0,1,0]
Z = Vector[0,0,1]

SLAB_HEIGHT = 4.25.inch
wall_height = 95.5.inch
wall_thickness = 6.inch

room_width = (16*12 + 70.75).inch
drywall_overhang = 0.825.inch

model :FirstFloorSlab do
    slab_width = room_width.inch + 2*drywall_overhang

    extrude length:SLAB_HEIGHT do
	polygon do
	    start_at	[0, -6.inch]
	    right	204.inch
	    up		338.312.inch
	    left	161.125.inch
	    up		10.inch
	    left	38.5.inch
	    down	3.5.inch
	    left	75.125.inch
	    down	368.092.inch
	    right	62.inch
	    up		23.28.inch
	end

	# Cutout for the recessed part of the floor
	polygon do
	    start_at	[-0.875, 0]
	    up		43.inch
	    move	-26.25.inch*Math.cos(45*Math::PI/180), 26.25.inch*Math.sin(45*Math::PI/180)
	    up		94.inch
	    up		34.25.inch
	    up		8.125.inch
	    up		25.inch
	    right	(16*12 + 26.5).inch
	    down	222.937.inch
	end
    end
end

inner_wall = Polygon.build do
    start_at	[0, 0]
    up		43.inch
    move	-26.25.inch*Math.cos(45*Math::PI/180), 26.25.inch*Math.sin(45*Math::PI/180)
    up		94.inch
    up		34.25.inch
    up		8.125.inch
    left	45.75.inch
    up		(109.875 + 25 - 80.5).inch
    right       2.5.inch
    up          80.5.inch
    right	75.125.inch
    up		3.5.inch
    right	26.5.inch
    down	10.inch
    right	(16*12 + 70.75 - 75.125 - 2.5 - 26.5).inch
    move_vertical_to 0
end

# The boundary of the understair closet and the front foyer
hallway_inner_wall = Polygon.build do
    start_at    [-14.72.inch, -23.28.inch]
    up      26.125.inch
    right   10.25.inch
    up      39.625.inch
    move    -27.inch*Math.cos(45*Math::PI/180), 27.inch*Math.sin(45*Math::PI/180)
    up      (94 + 34.25 + 3.25).inch
    left    40.inch
    down    216.342.inch
end

outer_wall = inner_wall.outset(wall_thickness) + hallway_inner_wall.outset(wall_thickness)

model :FirstFloorWalls do
    extrude length:wall_height do
	push outer_wall
	push inner_wall
	push hallway_inner_wall
    end

    # The weird bump in the wall
    extrude length:53.inch, :origin => [-64.72.inch, (332.812 - 85.375).inch] do
        rectangle [0,0], [6.75.inch, 85.375.inch]
    end

    # The cutout for the door to the understairs closet
    extrude length:5.inch, :origin => [-26.25.inch*Math.cos(45*Math::PI/180), (26.25.inch*Math.sin(45*Math::PI/180)+43+94)], :x => Y, :y => Z do
        rectangle [0,0], [34.5.inch, 80.inch]
    end

    # The cutout for the garage door
    extrude length:wall_thickness, :origin => [3.015.inch,0,0], :x => X, :y => Z do
        rectangle [0,0], [(16*12).inch, (7*12).inch]
    end

    # The cutout for the door from the stairwell to the garage
    extrude length:4.47.inch, :origin => [-4.47.inch, 5.75.inch], :x => Y, :y => Z do
        rectangle [0,0], [30.inch, 80.inch]
    end

    # The cutout for the front door
    extrude length:wall_thickness, :origin => [-(14.72+4.5).inch, -23.28.inch], :x => -X, :y => Z do
        rectangle [0,0], [36.inch, 81.inch]
    end
end

model :FirstFloor  do
    push FirstFloorSlab.new

    group :origin => [0, 0, SLAB_HEIGHT] do
	push FirstFloorWalls.new

        # Overhead beam
        extrude length:18.inch, :origin => [-18.562.inch, 143.5.inch, wall_height] do
            rectangle [0,0], [216.592.inch, 8.inch]
        end

        extrude length:7.25.inch, :origin => [(198.03-108.75).inch, (143.5-8.5).inch, wall_height] do
            rectangle [0,0], [108.75.inch, 8.5.inch]
        end

        extrude length:3.5.inch, :origin => [-18.562.inch, (143.5+8).inch, wall_height] do
            rectangle [0,0], [216.592.inch, 14.inch]
        end
    end
end