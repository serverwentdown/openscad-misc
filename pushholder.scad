$fa = 4;
$fs = 0.3;

include <BOSL/constants.scad>
use <BOSL/shapes.scad>
//use <BOSL/metric_screws.scad>

h = 80;

union() {
    tube(1, od1=24, od2=22, wall=1, align=ALIGN_NEG);
    translate([0, 0, -1]) tube(h-1, od=24, wall=1, align=ALIGN_NEG);
    tube(5, od=22, id=16, align=ALIGN_NEG);
    difference() {
        cyl(5, d=22, align=ALIGN_NEG);
        cuboid([24, 15, 5], align=ALIGN_NEG); /* Bump to 15.2 for a looser fit */
    }
    translate([0, 0, -h+1]) difference() {
        cyl(10, d=24, align=ALIGN_POS);
        translate([-8, 0, 0]) cuboid([24, 64, 5 * 10], align=V_RIGHT);
        translate([-8, 0, 10]) prismoid(size1=[24, 64], size2=[43, 64], h=10, align=V_RIGHT);
        translate([-6.1, 0, 1]) tube(3, od=10, wall=1.5, align=ALIGN_POS);
    }
}