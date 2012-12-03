require 'engineering'

SLAB_HEIGHT = 4.25.inch
wall_height = 95.5.inch

room_width = (16*12 + 70.75).inch
drywall_overhang = 0.825.inch

model :FirstFloorSlab do
    slab_width = room_width.inch + 2*drywall_overhang

    extrude SLAB_HEIGHT do
	polygon do
	    start_at	[-0.875, 0]
	    up		43.inch
	    move	-26.25.inch*Math.cos(45*Math::PI/180), 26.25.inch*Math.sin(45*Math::PI/180)
	    up		94.inch
	    up		34.25.inch
	    up		8.125.inch
	    up		25.inch
	    right	(16*12 + 26.5).inch
	    up		(109.875 - (10-3.5)).inch
	    left	room_width - 75.125 - 26.5 + drywall_overhang
	    up		10.inch
	    left	26.5.inch
	    down	3.5.inch
	    left	(75.125 + 0.825).inch
	    down	(109.875 + 25).inch
	    move_vertical_to 0
	end
    end
end

inner_wall = Polygon.build do
    start_at	[0, 0]
    up		43.inch
    move	-26.25.inch*Math.cos(45*Math::PI/180), 26.25.inch*Math.sin(45*Math::PI/180)
    up		94.inch
    left	5.inch		# Into the understair closet
    down	94.inch		# Fake wall length
    move	27.inch*Math.cos(45*Math::PI/180), -27.inch*Math.sin(45*Math::PI/180)
    down	39.625.inch
    left	10.25.inch
    down	26.125.inch
    left	(4.5+36+8.75).inch
    up		(94+27.inch*Math.sin(45*Math::PI/180)+39.625+26.125).inch
    up		(34.25 + 3.25).inch
    right	40.inch
    down	3.25.inch
    right	5.inch		# Leaving the understair closet
    up		8.125.inch
    left	45.75.inch
    up		(109.875 + 25).inch
    right	75.125.inch
    up		3.5.inch
    right	26.5.inch
    down	10.inch
    right	(16*12 + 70.75 - 75.125 - 26.5).inch
    move_vertical_to 0
end

model :FirstFloorWalls do
    extrude wall_height do
	push inner_wall.outset(6.inch)
	push inner_wall
    end
end

model :FirstFloor  do
    push FirstFloorSlab.new

    group :origin => [0, 0, SLAB_HEIGHT] do
    	push FirstFloorWalls.new
    end
end