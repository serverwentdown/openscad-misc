// Higher definition curves
$fa = 5;
$fs = 0.6;

include <BOSL/constants.scad>
use <BOSL/shapes.scad>

difference() {
    union() {
        cuboid([22, 32, 13], align=V_BACK);
        cuboid([42, 2, 13], align=V_BACK);
        translate([0, 30, 0]) ycyl(4, d=13, align=V_BACK);
    }
    cuboid([20.5, 30, 11.25], align=V_BACK);
    translate([0, 30, 0]) ycyl(4, d=11.25, align=V_BACK);
    cuboid([7, 40, 15], align=[0, 1, -1]);
    // Mounting
    translate([-16, 0, 0]) ycyl(2, d=3.2, align=V_BACK);
    translate([16, 0, 0]) ycyl(2, d=3.2, align=V_BACK);
}