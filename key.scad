include <parameters.scad>

translate([0,0, (len(pinning)*4)+9])
rotate([0,180,-360*$t])
key();


module key() {

    rotate([0,0,180])
    mirror([1,0,0])
    union() {
        // Cuts 
        difference() { 
            union() {
                for (i=[0:len(pinning)-1]) {
                    translate([0,0,1+(4*i)])
                    keycut(pinning[i]);
                }
            }

            // For keyway shape
            translate([-2.25,0,-200])
            cylinder(r=2.2, h=300);
        }


        // Handle
        translate([0,0,1+(4*len(pinning))])
        linear_extrude(3) 
        square([4.5,9], center=true);

        translate([0,0,4+(4*len(pinning))])
        linear_extrude(5) 
        square([4.5,15], center=true); 
    }

}

module keycut(i) {

    rotate([0,0,90])
    translate([0,2.25,0])
    linear_extrude(4) 
    difference() {
        circle(4.5);
        polygon([[-5,0], [5,0], [5,5], [-5,5]]);
        polygon([[0,0], [-10,-(10*tan((i*20*.95)))], [-10, 0]]);
    }

}
