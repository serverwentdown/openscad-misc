// Higher definition curves
$fa = 10;
$fs = 0.2;

shrinkcomp = 1;  // Amount of ABS shrinkage
length = 6;
inner_width = 19 * shrinkcomp;
inner_height = 5.5 * shrinkcomp;
thick = 1;
r = 2;

slot = 0.2;

module roundedcube_z(size, r=1) {
    translate([-(size[0]-r*2)/2, -(size[1]-r*2)/2, 0]) minkowski() {
        cube([size[0]-r*2, size[1]-r*2, size[2]/2]);
        cylinder(size[2]/2, r=r);
    }
}

difference() {
    roundedcube_z([inner_width+thick*2, inner_height+thick*2, length], r=1.5);
    translate([0, 0, -0.5]) roundedcube_z([inner_width, inner_height, length+1], r=0.75);
    translate([inner_width/2-2, 0, 0]) cube([slot, inner_height/2+thick+0.5, length+1]);
}