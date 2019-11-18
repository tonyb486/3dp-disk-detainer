include <parameters.scad>

$fn=200;
for (i=[0:len(pinning)-1]) {
    translate([25*(floor(i/2)),25*(i%2), 0])
    disk(pinning[i]);
}

module disk(cut) {

    union() {

        // Disk with Gate & Keyway
        difference() {
            // Disk with Notch
            union() {
                // Disk
                linear_extrude(2) circle(r=10);

                // Curved Notch
                intersection() {
                    linear_extrude(2)
                    polygon([[0,0], [50,-16], [50,16]]);
                    linear_extrude(2) circle(r=11.5);
                }
            }

            // Gate
            rotate([0,0,(10*cut)])
            translate([-10,0,-.1])
            linear_extrude(2.2) 
            circle(r=2);

            // Keyway

            translate([0,0,-.1])
            linear_extrude(10) 
            union() {
                translate([0,0,0]) circle(2.5);
                translate([-2.5,-5,0]) square(5);
            }

        }



        // Spacers
        translate([0,0,1])
        difference() {
            linear_extrude(2) circle(r=8);
            translate([0,0,-.1])
            linear_extrude(2.2) circle(r=6);
        }

    }

}
