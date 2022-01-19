// Higher definition curves
$fa = 5;
$fs = 0.05;

module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
    // Copied from https://danielupshaw.com/openscad-rounded-corners/
    
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	module build_point(type = "sphere", rotate = [0, 0, 0]) {
		if (type == "sphere") {
			sphere(r = radius);
		} else if (type == "cylinder") {
			rotate(a = rotate)
			cylinder(h = diameter, r = radius, center = true);
		}
	}

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							build_point("sphere");
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							build_point("cylinder", rotate);
						}
					}
				}
			}
		}
	}
}

inner_x = 31.5;
inner_y = 20.5;
inner_z = 6;
thick = 1;

retain_y = 16.4;

rotate([180, 0, 0]) union() {
    translate([- inner_x / 2 - thick, - inner_y / 2 - thick, -50]) difference() {
        roundedcube([inner_x + thick * 2, inner_y + thick * 2, inner_z + thick + 50], radius=(3 + thick), apply_to="zmax");
        translate([thick, thick, 0]) roundedcube([inner_x, inner_y, inner_z + 50], radius=3, apply_to="zmax");
        cube([inner_x + thick * 2, inner_y + thick * 2, 50]);
    };
    difference() {
        union() {
            translate([inner_x / 4, 0, 2.5]) difference() {
                translate([-3, - inner_y / 2, 0]) cube([6, inner_y, (inner_z - 2.5)]);
                cylinder(1.75, r=2.5);
            };
            translate([-inner_x / 4 - 2, 0, 1.5]) union() {
                translate([-3, retain_y/2, 0]) cube([8, (inner_y - retain_y) / 2, inner_z - 1.5]);
                translate([-3, (-inner_y + retain_y)/2 -retain_y/2, 0]) cube([8, (inner_y - retain_y) / 2, inner_z - 1.5]);
            };
        };
        translate([0, inner_y / 2 + 1.2, 6]) rotate([45, 0, 0]) cube([inner_x, 4, 8], center=true);
        translate([0, -inner_y / 2 - 1.2, 6]) rotate([-45, 0, 0]) cube([inner_x, 4, 8], center=true);
    };
}