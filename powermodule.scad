// Higher definition curves
$fa = 30;
$fs = 0.1;


inner_height = 13;
inner_width = 22;
inner_length = 44;
end_area = 6;

module case() {

    // base plate
    difference() {
        t = 2;
        end_t = 3;
        translate([0, 0, end_t/2]) cube([inner_width, inner_length+end_area*2, end_t], center=true);
        translate([0, 0, end_t-(end_t-t)/2]) cube([inner_width, inner_length, (end_t-t)], center=true);
        translate([-inner_width/2+3.5, inner_length/2-15, 2-1.5/2]) cube([2, 8, 1.5], center=true);
        // perforation
        for (i = [-5:5]) {
            for (j = [-2:2]) {
                //translate([j*5, i*5, 0]) cylinder(4, d=3.5);
                translate([j*5, i*5, 4/2]) cube([3.5, 3.5, 4], center=true);
            }
        }
    }
    translate([-inner_width/2+2.5, -inner_length/2+6.2, 2]) cylinder(2, d=1.5);
    translate([inner_width/2-2.5, inner_length/2-6.2, 2]) cylinder(2, d=1.5);

    // top plate
    translate([0, 0, 0]) difference() {
        translate([0, 0, inner_height+2+2/2]) cube([inner_width, inner_length+end_area*2, 2], center=true);
        translate([-inner_width/2+3, inner_length/2-19.3, inner_height+2]) cylinder(1.5, d=3);
        // perforation
        for (i = [-5:5]) {
            for (j = [-2:2]) {
                //translate([j*5, i*5, inner_height+2]) cylinder(2, d=3.5);
                translate([j*5, i*5, inner_height+4/2]) cube([3.5, 3.5, 4], center=true);
            }
        }
    }

    // side plates
    difference() {
        translate([-inner_width/2-2/2, 0, inner_height/2+2]) cube([2, inner_length+end_area*2, inner_height+2*2], center=true);
        // perforation
        for (i = [-8:8]) {
            for (j = [-1:1]) {
                translate([-inner_width/2-2, i*3-1/2, inner_height/2+2+j*5-3/2]) cube([2, 1.5, 3.5]);
            }
        }
    }
    difference() {
        translate([inner_width/2+2/2, 0, inner_height/2+2]) cube([2, inner_length+end_area*2, inner_height+2*2], center=true);
        // perforation
        for (i = [-8:8]) {
            for (j = [-1:1]) {
                translate([inner_width/2, i*3-1/2, inner_height/2+2+j*5-3/2]) cube([2, 1.5, 3.5]);
            }
        }
    }

    // end plates
    difference() {
        translate([0, -(inner_length+end_area*2)/2-2/2, inner_height/2+2]) cube([inner_width+2*2, 2, inner_height+2*2], center=true);
        translate([0, -(inner_length+end_area*2)/2, inner_height/2+2]) rotate([90, 0, 0]) cylinder(2, d=4);
    }
    difference() {
        translate([0, (inner_length+end_area*2)/2+2/2, inner_height/2+2]) cube([inner_width+2*2, 2, inner_height+2*2], center=true);
        translate([0, (inner_length+end_area*2)/2+2, inner_height/2+2]) rotate([90, 0, 0]) cylinder(2, d=4);
    }
}

width = inner_width+2*2;
length = inner_length+end_area*2+2*2;
height = inner_height+2*2;

module mount() {
    difference() {
        union() {
            translate([0, 0, height/4]) cube([width, length, height/2], center=true);
            translate([width/2-7/2, length/2-2/2, height/2+6/2]) cube([7, 2, 6], center=true);
            translate([-width/2+5/2, -length/2+2/2, height/2+6/2]) cube([5, 2, 6], center=true);
        }
        translate([width/2-5/2, -length/2+2/2, height/2-6/2]) cube([5, 2, 6], center=true);
        translate([-width/2+7/2, length/2-2/2, height/2-6/2]) cube([7, 2, 6], center=true);
    }
}


translate([20, 0, 0]) intersection() {
    case();
    mount();
}

translate([-20, 0, 0]) intersection() {
    rotate([0, 180, 0]) translate([0, 0, -height]) case();
    mount();
}
