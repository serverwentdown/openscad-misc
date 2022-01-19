include <BOSL/shapes.scad>;

x = 31.5;
y = 41.5;
z = 17;

difference() {
    cuboid([x+3, y+3, z+2]);
    cuboid([x, y, z]);
    translate([0, y/2, 0]) cuboid([14, 1.5, 6], align=V_BACK);
    translate([0, -y/2, z/2-4/2]) cuboid([7, 1.5, 4], align=V_FRONT);
}

translate([0, -y/2, z/2-4/2]) difference() {
    cuboid([7+3, 10, 4+2  ], align=V_FRONT);
    cuboid([7, 10, 4], align=V_FRONT);
}