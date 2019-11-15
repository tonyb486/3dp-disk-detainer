pinning = [4,5,6,7,8,9];
body();

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
        translate([0,0,-.1])
        linear_extrude(2.2) circle(r=6);
    }

}


