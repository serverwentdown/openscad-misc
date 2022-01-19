// Higher definition curves
$fa = 8;
$fs = 0.3;

include <BOSL/constants.scad>
use <BOSL/shapes.scad>

union() {
    translate([0, 0, 1.5]) cuboid([112, 34, 1], fillet=2, edges=EDGE_FR_RT+EDGE_FR_LF+EDGE_BK_RT+EDGE_BK_LF, align=V_ALLPOS);
    difference() {
        translate([0, 1.5, 0]) cuboid([112, 34-1.5, 2.5], fillet=2, edges=EDGE_FR_RT+EDGE_FR_LF+EDGE_BK_RT+EDGE_BK_LF, align=V_ALLPOS);
        translate([112/2, 5, 0]) linear_extrude(0.5) rotate([0, 180, 0]) text("totally not a 3d print", size=6, font="IBM Plex Sans", halign="center");
    }
    translate([112, 34/2, 0]) difference() {
        union() {
            cuboid([24, 12, 2.5], fillet=12/2, edges=EDGE_FR_RT+EDGE_FR_LF+EDGE_BK_RT+EDGE_BK_LF, align=V_UP);
            translate([24/4, 0, -2]) cylinder(2, d=8);
        }
        translate([24/4, 0, -3]) cylinder(6, d=3.5);
        translate([24/4, 0, 1]) cylinder(1.5, d=5.5);
    }
    translate([112, 34/2+12/2, 0]) color("green") interior_fillet(l=2.5, r=1, orient=ORIENT_Z, align=V_UP);
    translate([112, 34/2-12/2, 0]) color("green") interior_fillet(l=2.5, r=1, orient=ORIENT_Z_270, align=V_UP);
    translate([-2, 5, 1.5-3]) cuboid([3, 8, 3], align=V_ALLPOS);
    translate([-2, 34-8-2.5, 1.5-3]) cuboid([3, 8, 3], align=V_ALLPOS);
    translate([112/2-28-16/2, 34/2, -3]) cuboid([28, 3, 3], align=V_ALLPOS);
    translate([112/2+16/2, 34/2, -3]) cuboid([28, 3, 3], align=V_ALLPOS);
}