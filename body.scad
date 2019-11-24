include <parameters.scad>

body();

//translate([0,40,0])
//shell();

module body() {
    
    difference() {
        // Base of the body
        cylinder(r=12, h=4*len(pinning)+5);

        // Cutout for the disks
        translate([0,0,3])
        cylinder(r=9.2, h=4*len(pinning)+5.2);

        // A notch for each disk
        for (i=[0:len(pinning)-1]) {
            translate([0,0,4+(4*i)])
            hull() {
                cylinder(r=9, h=4);
                translate([0,0,1]) cylinder(r=10.5, h=2);
            }
        }
        // Cutout for the notches
        translate([0,0,3])
        linear_extrude(4*len(pinning)+11)
        polygon([[0,0], [50,-17], [-17,50]]);

        // Cutout for the sidebar
        translate([0,0,3])
        linear_extrude(4*len(pinning)+11)
        polygon([[0,0], [-5,-20], [5,-20]]);
    }
}




module shell() {

    difference() {
        // Base of the body
        union() {
            cylinder(r=14, h=4*len(pinning)+7);
            translate([0,12,0])
            cylinder(r=4, h=4*len(pinning)+7);
        }

        // Cutout for the body
        translate([0,0,1])
        cylinder(r=12.5, h=4*len(pinning)+6.1);

        // Cutout for the keyway
        translate([0,0,-.1])
        cylinder(r=6.5, h=10);

        // Cutout for the sidebar
        translate([0,12,1])
        cylinder(r=2, h=4*len(pinning)+6.1);

    }


}

