module slot(thickness, walls, base, height, width) {
    total_thickness = thickness + walls * 2;
    total_height = height + base;
    
    difference() {
        translate([-width/2, -total_thickness/2, 0]) cube([width, total_thickness, total_height]);
        translate([-(width + 10)/2, -thickness/2, base]) cube([width + 10, thickness, total_height + 10]);
    }
}

module stand(top_height, top_width, base_height, base_width, base_thick, base_stretch) {
    translate([-base_width/2, -base_height/2, 0]) cube([base_width, base_height, base_thick]);
    translate([0, 0, base_thick]) polyhedron([
        [-base_width/2, -base_height/2, 0],
        [base_width/2, -base_height/2, 0],
        [base_width/2, base_height/2, 0],
        [-base_width/2, base_height/2, 0],
    
        [-top_width/2, -top_height/2, base_stretch],
        [top_width/2, -top_height/2, base_stretch],
        [top_width/2, top_height/2, base_stretch],
        [-top_width/2, top_height/2, base_stretch],
    
    ], [
        [ 0, 4, 5, 1 ],
        [ 1, 5, 6, 2 ],
        [ 2, 6, 7, 3 ],
        [ 3, 7, 4, 0 ],
        
        [ 7, 6, 5, 4 ],
        [ 0, 1, 2, 3 ],
    ]);
}

top_height = 9;
top_width = 20;

base_height = top_height + 60;
base_width = top_width + 0;
base_thick = 2;
base_stretch = 30;

thickness = 3;
walls = 3;
base = 4;
height = 50;
width = 20;

difference() {
    stand(top_height, top_width, base_height, base_width, base_thick, base_stretch);
    hull() slot(thickness, walls, base, height, width);
    translate([0, 0, 2]) stand(top_height, top_width, base_height-9, base_width, 0, base_stretch-4);
}
slot(thickness, walls, base, height, width);