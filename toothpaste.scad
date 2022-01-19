// Higher definition curves
$fa = 5;
$fs = 0.2;

base_d = 36;
base_h = 15;

thick = 1.5;
gap = 1.3;
mount_thick = thick * 1.8;
mount_height = 40;
mount_width = base_d;
mount_r = 8;


module chamfer() {
    front = 5;
    height = 8;
    translate([0, -(base_d+thick*2)/2+thick-gap, base_h+thick]) polyhedron([
        [-mount_width/2, front, 0],
        [4, 0, 0],
        [-mount_width/2, 0, height],
        [-mount_width/2, 0, 0],
    ], [
        [0, 1, 2],
        [3, 0, 2],
        [3, 1, 0],
        [3, 2, 1],
    ]);
}

difference() {
    union() {
        // Rounded top of mount
        translate([-(mount_width-mount_r*2)/2, -(base_d+thick*2)/2-mount_thick+thick-gap, mount_height-mount_r]) cube([mount_width-mount_r*2, mount_thick, mount_r]);
        translate([-(mount_width-mount_r*2)/2, -(base_d+thick*2)/2-mount_thick+thick-gap, mount_height-mount_r]) rotate([-90, 0, 0]) cylinder(mount_thick, r=mount_r);
        translate([(mount_width-mount_r*2)/2, -(base_d+thick*2)/2-mount_thick+thick-gap, mount_height-mount_r]) rotate([-90, 0, 0]) cylinder(mount_thick, r=mount_r);
        // Mount
        translate([-(mount_width)/2, -(base_d+thick*2)/2-mount_thick+thick-gap, 0]) cube([mount_width, mount_thick, mount_height-mount_r]);
        // Base attachment
        translate([-(mount_width)/2, -(base_d+thick*2)/2, 0]) cube([mount_width, (base_d+thick*2)/2, base_h+thick]);
        // Base
        cylinder(base_h+thick, d=base_d+thick*2);
        chamfer();
        mirror([1, 0, 0]) chamfer();
    }
    translate([0, 0, thick]) cylinder(base_h, d=base_d);
    cylinder(base_h+thick, d=20);
}