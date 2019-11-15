disk(1);

module disk(cut) {

    union() {

        // Disk with Gate & Keyway
        translate([0,0,1])
        difference() {
            // Disk with Notch
            union() {
                // Disk
                linear_extrude(1) circle(r=10);

                // Curved Notch
                intersection() {
                    linear_extrude(1)
                    polygon([[0,0], [50,-16], [50,16]]);
                    linear_extrude(1) circle(r=11.5);
                }
            }

            // Gate
            rotate([0,0,90-(10*cut)])
            translate([-10,0,-.1])
            linear_extrude(1.2) 
            circle(r=2);

            // Keyway
            translate([0,0,-.1])
            linear_extrude(10) 
            square([5,10], center=true);
        }

        // Spacers
        translate([0,0,2])
        difference() {
            linear_extrude(2) circle(r=8);
            translate([0,0,-.1])
            linear_extrude(2.2) circle(r=6);
        }

    }

}
