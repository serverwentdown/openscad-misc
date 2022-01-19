width = 40;
height = 22;
thick = 15;

slot_t = 2;
slot_h = 2;

union() {
    difference() {
        cube([thick+slot_t*2, width, height]);
        translate([-1, 0, height-11]) rotate([-90, 0, 0]) cylinder(width, r=9);
        translate([thick+slot_t*2+1, 0, height-11]) rotate([-90, 0, 0]) cylinder(width, r=9);
    }
    translate([0, 0, height]) cube([slot_t, width, slot_h]);
    translate([thick+slot_t, 0, height]) cube([slot_t, width, slot_h]);
}