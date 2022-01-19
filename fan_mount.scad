$fs = 0.4;

module squaremount(width, height, d, thick) {
    module hole(a, b) {
        translate([a*(width/2), b*(height/2), +thick/2]) cylinder(thick, d=d, center=true);
    }
    hole(-1, 1);
    hole(1, 1);
    hole(-1, -1);
    hole(1, -1);
}

module fan_mount() {
    difference() {
        translate([0, -20, 0]) cube([10, 20, 40]);
        translate([0, -10.5, 0]) rotate([0, 0, -45]) cube([20, 20, 40]);
        
        translate([0, -20, 0]) cube([10, 10, 40]);
        translate([0, -20, 20]) rotate([0, 90, 0]) cylinder(10, d=38);
        translate([0, -20, 20]) rotate([0, 90, 0]) squaremount(32, 32, 3.2, 10);
        translate([2, -20, 20]) rotate([0, 90, 0]) squaremount(32, 32, 6, 8);
        translate([14, 0, 20]) rotate([90, 0, 0]) squaremount(18, 18, 3.2, 10);
        translate([14, -2, 20]) rotate([90, 0, 0]) squaremount(18, 18, 6, 8);
    }
}

fan_mount();
//translate([0, 0, 40]) fan_mount();
//translate([0, 0, 80]) fan_mount();