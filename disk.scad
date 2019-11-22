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
                linear_extrude(2)
                intersection() {
                    polygon([[0,0], [50,-16], [50,16]]);
                    circle(r=11.5);
                }
            }

            // Gate
            rotate([0,0,(20*cut)])
            translate([-10,0,-.1])
            scale([1,1.3,1])
            linear_extrude(2.2) 
            circle(r=2);

            // Keyway
            translate([0,0,-.1])
            linear_extrude(2.2) 
            difference() {
                circle(5);
                circle(2.0);
                translate([-5,-10,0])  square([10,10]);
            }

        }

        // Label
        translate([2,-4,1.5]) 
        rotate([0,0,90])
        linear_extrude(1) 
        text(str(cut), size=4);
        
        // Spacers
        translate([0,0,2])
        difference() {
            linear_extrude(2) circle(r=8);
            translate([0,0,-.1])
            linear_extrude(2.2) circle(r=6);
        }

    }

}

module keyshape() {
}