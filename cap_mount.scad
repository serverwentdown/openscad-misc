$fa = 5;
$fs = 0.4;

ring_t = 3;
cap_dia = 65;

module mount(x) {
    translate([15/2-6/2, 4-2.4/2, x-5.5/2]) cube([15, 2.4, 5.5]);
    translate([15/2, 0, x]) rotate([-90, 0, 0]) cylinder(12, d=3);
}

difference() {
    union() {
        translate([0, cap_dia/2+ring_t, 0]) rotate([0, 90, 0]) cylinder(15, d=cap_dia+ring_t*2);
        translate([0, 0, -cap_dia/2]) cube([15, cap_dia/2, cap_dia]);
    }
    mount(cap_dia/2-6);
    mount(-cap_dia/2+6);
    translate([0, cap_dia/2+ring_t, 0]) rotate([0, 90, 0]) {
        cylinder(30, d=cap_dia-10);
        translate([0, 0, 3]) cylinder(130, d=cap_dia);
    }
}   