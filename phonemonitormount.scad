// Higher definition curves
$fa = 5;
$fs = 0.05;

module slot() {
    walls = 3;
    base = 3;
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

module mount() {
    top = 2;
    thick = 2;
    depth = 15;
    
    frontgap_width = 75;
    frontgap_height = 7;
    
    backgap_width = 55;
    backgap_height = 15;
    
    correction = 0.5;
    
    difference() {
        linear_extrude(depth + top) offset(thick + correction) import("mount-cross.svg");
        union() {
            linear_extrude(depth) offset(correction) import("mount-cross.svg");
            translate([-frontgap_width/2, -50, 0]) cube([frontgap_width, 50, frontgap_height]);
            translate([-backgap_width/2, 0, 0]) cube([backgap_width, 50, backgap_height]);
        }
    }
}

mount();
translate([0, 0, 15 + 2]) slot();