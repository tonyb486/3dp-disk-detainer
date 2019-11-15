pinning = [4,5,6,7,8,9];
key();

module key() {

    // Cuts
    for (i=[0:len(pinning)-1]) {
        translate([0,0,1+(3.1*i)])
        keycut(pinning[i]);
    }

    // Bottom Spacer
    linear_extrude(1) 
    square([3,3], center=true);

    // Handle
    translate([0,0,1+(3.1*len(pinning))])
    linear_extrude(5) 
    square([3,9], center=true);

    translate([0,0,6+(3.1*len(pinning))])
    linear_extrude(10) 
    square([6,20], center=true);

}

module keycut(i) {
    intersection() {
        rotate([0,0,-(90-10*i)])
        linear_extrude(3.1) 
        square([3.5,9], center=true);
        linear_extrude(3.1) 
        square([3,9], center=true);
    }
}
