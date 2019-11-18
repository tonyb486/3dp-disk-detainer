include <parameters.scad>

translate([0,0, (len(pinning)*3)+9])
rotate([0,180,-180*$t])
key();


module key() {

    rotate([0,0,180])
    mirror([1,0,0])
    union() {
        // Cuts
        for (i=[0:len(pinning)-1]) {
            translate([0,0,1+(3*i)])
            keycut(pinning[i]);
        }

        // Curve on side
        difference() {
            translate([0,0,1])
            linear_extrude(3*len(pinning)) 
            circle(2.25);

            translate([0,0,.9])
            linear_extrude(3*len(pinning)+.1) 
            square(2.25);
        }

        // Bottom Spacer
        linear_extrude(1) circle(1.5);

        // Handle
        translate([0,0,1+(3*len(pinning))])
        linear_extrude(3) 
        square([4.5,9], center=true);

        translate([0,0,4+(3*len(pinning))])
        linear_extrude(5) 
        square([4.5,15], center=true);
    }

}

module keycut(i) {

    translate([2.25,0,0])
    rotate([0,0,90])
    linear_extrude(3) 
    polygon([[0,0],[0,4.5], [4.5,4.5], [4.5, 4.5*tan(i*10)]]);

}
