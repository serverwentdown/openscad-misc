// Higher definition curves
$fa = 8;
$fs = 0.3;

difference() {
    union() {
        cube([2, 21, 64]);
        translate([1, 0, 0]) cube([1, 30, 64]);
        translate([-20, 12, 0]) cube([20, 2, 64]);
        translate([-20, 12+5+2, 0]) cube([20, 2, 64]);
    }
    
    translate([0, 4, 2]) union() {
        rotate([0, 90, 0]) cylinder(3, d=3);
        translate([0, 0, 60]) rotate([0, 90, 0]) cylinder(3, d=3);
        translate([0, -4, 8]) cube([2, 2, 47]);
    }
}