require 'engineering'

X = Vector[1,0,0]
Y = Vector[0,1,0]
Z = Vector[0,0,1]

door_height = 80.25.inch
interior_doorjamb_width = 4.875.inch
kitchen_ceiling_height = 96.inch
midlevel_floor_height = 22.5.inch
wall_height = 109.inch
exterior_wall_thickness = 6.inch

bathroom = Polygon.build do
    start_at    [(-33.5+28.75).inch, (40.75+4.875).inch]
    up          49.625.inch
    left        17.75.inch
    up          35.5.inch
    left        42.25.inch
    down        85.125.inch
end

closet = Polygon.build do
    start_at    [(-32.125+3.25).inch, -4.875.inch]
    left        (3.25+24.5+8.125).inch
    down        17.75.inch
    right       18.5.inch
    down        20.25.inch
    right       17.125.inch
end

inner_wall = Polygon.build do
    start_at    [0,0]
    down        42.875.inch
    right       154.875.inch
    up          (42.875+40.75+95.125+40.375+7+141-49.5-138.75-19.25).inch
    left        12.5.inch   # The column on the wall between the kitchen and dining room
    up          19.25.inch
    right       12.5.inch
    up          138.75.inch # Dining room wall
    left        107.5.inch  # The wall with the sliding glass door
    up          49.5.inch
    left        156.875.inch    # The wall with the fireplace
    down        141.inch
    right       81.5.inch       # The divider wall between the living room and the stairs
    down        7.inch
    left        81.5.inch
    down        (40.375+95.125+40.75+22.374).inch
    right       40.inch         # The wall with the windows in the stairwell
    up          22.374.inch
end

pantry = Polygon.build do
    start_at    [-4.875.inch, -4.75.inch]
    left        19.125.inch
    down        38.125.inch
    right       19.125.inch
end

pointA = Point[47.375.inch, 274.75.inch]
pointB = pointA + Point[0, 49.5]

model :SecondFloor do
	extrude length:wall_height do
        push inner_wall.outset(exterior_wall_thickness) + pantry.outset(exterior_wall_thickness) + closet.outset(exterior_wall_thickness)
        push inner_wall
        push pantry
        push closet
    end

    # Kitchen column
    extrude length:kitchen_ceiling_height do
        rectangle   origin:[37.25.inch, (91.75-42.875).inch], size:[14.5.inch, 20.5.inch]
    end

    # Kitchen windows
    extrude length:exterior_wall_thickness, :origin => [0, -42.875.inch, 31.25], :x => X, :y => Z do
        rectangle   origin:[7.5.inch,0], size:[28.625.inch, 58.875.inch]
        rectangle   origin:[(7.5+28.625+6.875).inch, 0], size:[28.625.inch, 58.875.inch]
    end

    # Cutout for kitchen pantry door
    extrude length:interior_doorjamb_width, :origin => [0, (-6.875-36).inch], :x => Y, :y => Z do
        rectangle [0,0], [36.inch, 81.25.inch]
    end

    # Kitchen Kneewall
    kneewall_subcounter_thickness = 2.25.inch
    kneewall_height = 42.5.inch - kneewall_subcounter_thickness
    kneewall_width = 6.inch
    half_angle = (45/2)*Math::PI/180
    corner_extend_length = kneewall_width * Math.tan(half_angle)
    kneewall_start_x = -(65.5 + corner_extend_length).inch
    extrude length:kneewall_height, origin:[142.375.inch, (116.75 + 4.875 + kneewall_width).inch] do
    	polygon do
	    start_at	[kneewall_start_x, 0]
	    move_horizontal_to	0.inch
	    down	kneewall_width
	    left	65.5.inch
	    move	-33.25.inch*Math.cos(45*Math::PI/180), -33.25.inch*Math.sin(45*Math::PI/180)
	    down	28.75.inch
	    left	kneewall_width
	    up		28.75.inch + corner_extend_length
	end
    end

    # Kitchen kneewall sub-countertop
    kneewall_counter_width = 12.inch
    corner_extend_length = kneewall_counter_width * Math.tan(half_angle)
    extrude length:kneewall_subcounter_thickness, origin:[142.375.inch, (116.75 + 4.875 + kneewall_counter_width).inch, kneewall_height] do
	polygon do
	    start_at	[kneewall_start_x - corner_extend_length, 0]
	    move_horizontal_to	0.inch
	    down	kneewall_counter_width
	    left	65.5.inch
	    move	-33.25.inch*Math.cos(45*Math::PI/180), -33.25.inch*Math.sin(45*Math::PI/180)
	    down	28.75.inch
	    left	kneewall_counter_width
	    up		28.75.inch + corner_extend_length
	end
    end

    # Kitchen ceiling

    # Midlevel
    group do
        # Cutout for the closet door
        extrude length:interior_doorjamb_width, :origin => [-32.125.inch, 0, midlevel_floor_height], :x => -X, :y => Z do
            rectangle [0,0], [24.5.inch, door_height]
        end

        # Bathroom
        extrude length:wall_height do
            rectangle   origin:[0, 40.75], size:[-69.5.inch, 95.125.inch]
        end

        # The bathroom floor
        extrude length:wall_height-midlevel_floor_height, :origin => [0,0,wall_height] do
            push bathroom
        end

        # The closet floor
        extrude length:midlevel_floor_height, :origin => [0,0,midlevel_floor_height] do
            push closet
        end

        # The steps between the landing and the kitchen
        extrude length:-40.75.inch, :origin => [-69.5.inch, 0, 0], :x => X, :y => Z do
            polygon do
                start_at    [0,0]
                right       (69.5-2).inch
                up          7.5.inch        # First step
                left        9.5.inch
                up          7.5.inch        # Second step
                left        10.inch
                up          7.5.inch        # Last step
                left        (69.5-2-9.5-10).inch
            end
        end

        # The landing
        extrude length:-40.inch, :origin => [-69.5.inch, -22.374.inch], :x => Y, :y => Z do
            polygon do
                start_at    [0,0]
                right       63.124.inch
                up          midlevel_floor_height
                left        63.124.inch
            end
        end

        # Cutout for the bathroom door
        extrude length:interior_doorjamb_width, :origin => [-33.5.inch, 40.75.inch, midlevel_floor_height], :x => -X, :y => Z do
            rectangle   [0,0], [28.625.inch, door_height]
        end
    end

    # The kneewall by the stairs
    extrude length:34.inch, :origin => [-28.inch, 176.25.inch, 0] do
        rectangle [0,0], [29.5.inch, 7.inch]
    end

    # Cutout for Sliding door
    extrude length:exterior_wall_thickness, :origin => [(154.875-16.75).inch, 274.75.inch], :x => -X, :y => Z do
        rectangle origin:[0,0], size:[70.75.inch, 93.5.inch]
    end

    # Cutouts for living room windows
    extrude length:exterior_wall_thickness, :origin => [pointB.x-4.95, pointB.y, 26.inch], :x => -X, :y => Z do
        rectangle origin:[0,0], size:[34.75.inch, 50.inch]
    end
    extrude length:exterior_wall_thickness, :origin => [pointB.x-4.95-34.75-78-34.75, pointB.y, 26.inch], :x => X, :y => Z do
        rectangle origin:[0,0], size:[34.75.inch, 50.inch]
    end
    extrude length:exterior_wall_thickness, :origin => [pointA.x, pointA.y+10+35, 26.inch], :x => -Y, :y => Z do
        rectangle origin:[0,0], size:[35.inch, 50.inch]
    end
end