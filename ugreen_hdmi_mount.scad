// Higher definition curves
$fa = 5;
$fs = 0.6;

include <BOSL/constants.scad>
use <BOSL/shapes.scad>

difference() {
    union() {
        cuboid([23, 32, 14], align=V_BACK);
        cuboid([42, 2, 14], align=V_BACK);
        translate([0, 30, 0]) ycyl(4, d=14, align=V_BACK);
    }
    cuboid([21, 30, 12], align=V_BACK);
    translate([0, 30, 0]) ycyl(4, d=11.25, align=V_BACK);
    cuboid([7, 40, 15], align=[0, 1, -1]);
    // Mounting
    translate([-16, 0, 0]) ycyl(2, d=3.2, align=V_BACK);
    translate([16, 0, 0]) ycyl(2, d=3.2, align=V_BACK);
}