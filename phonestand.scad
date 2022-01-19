module slot() {
    walls = 3;
    base = 6;
    thickness = 7.5;
    //height = 77.5;
    height = 30;
    width = 70;
    
    total_thickness = thickness + walls * 2;
    total_height = height + base;
    
    difference() {
        translate([-width/2, -total_thickness/2, 0]) cube([width, total_thickness, total_height]);
        translate([-(width + 10)/2, -thickness/2, base]) cube([width + 10, thickness, total_height + 10]);
    }
}

module stand() {
    height = 100;
    top_height = 13.5;
    top_width = 70;
    
    base_width = top_width + 0;
    base_height = top_height + 25;
    base_stretch = 20;
    
    translate([-top_width/2, -top_height/2, 0]) cube([top_width, top_height, height]);
    translate([-base_width/2, -base_height/2, 0]) cube([base_width, base_height, 2]);
    translate([0, 0, 2]) polyhedron([
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

stand();
translate([0, 0, 100]) slot();