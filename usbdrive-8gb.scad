// Higher definition curves
$fa = 5;
$fs = 0.2;

include <BOSL/constants.scad>
use <BOSL/shapes.scad>

inner_l = 30;
inner_w = 14;
inner_h = 4.6;

thick = 1;

step = 2.5;

module box(l, w, h, t, t_start=0, r=0) {
    ts = (t_start == 0 ? t : t_start);
    difference() {
        translate([-ts, -t, -t]) cuboid([l+t+ts, w+t*2, h+t*2], center=false, fillet=r);
        cube([l, w, h]);
    }
}

module usbbox(l, w, h, t) {
    buf = 0.1;
    heighten = 0.1;
    widen = 0.3;
    t_start = 4;
    difference() {
        box(l, w, h, t, t_start=t_start, r=2);
        translate([- t_start - buf, - (12+widen)/2 + w/2, - (4.5+heighten)/2 + h/2]) cube([t_start + buf*2, (12+widen), (4.5+heighten)]);
    }
}

union() {
    usbbox(inner_l, inner_w, inner_h, thick);
    translate([inner_l - 3, 0, 0]) cube([3, inner_w, step]);
}
