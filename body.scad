include <parameters.scad>

//body();

//translate([0,0,3*len(pinning)+7])
//rotate([0,180,0])
shell();


module body() {
    difference() {
        // Base of the body
        cylinder(r=12, h=3*len(pinning)+5);

        // Cutout for the disks
        translate([0,0,3])
        cylinder(r=10.5, h=3*len(pinning)+5.2);

        // Cutout for the notches
        translate([0,0,3])
        linear_extrude(3*len(pinning)+11)
        polygon([[0,0], [50,-17], [-17,50]]);

        // Cutout for the sidebar
        translate([0,0,3])
        linear_extrude(3*len(pinning)+11)
        polygon([[0,0], [-5,-20], [5,-20]]);
    }

    // Spacer
    translate([0,0,3])
    difference() {
        linear_extrude(2) circle(r=8);
        translate([0,0,.1])
        linear_extrude(2.2) circle(r=6);
    }

}

module shell() {

    difference() {
        // Base of the body
        union() {
            cylinder(r=14, h=3*len(pinning)+7);
            translate([0,12,0])
            cylinder(r=4, h=3*len(pinning)+7);
        }

        // Cutout for the body
        translate([0,0,1])
        cylinder(r=12.5, h=3*len(pinning)+6.1);

        // Cutout for the keyway
        translate([0,0,-.1])
        cylinder(r=6.5, h=10);

        // Cutout for the sidebar
        translate([0,12,1])
        cylinder(r=2, h=3*len(pinning)+6.1);

    }


}

