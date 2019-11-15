use <disk.scad>
use <body.scad>
use <key.scad>
pinning = [4,5,6,7,8,9];

//$fn = 100;
module animation() {
    union() {
        color("green",0.75)
        for (i=[0:len(pinning)-1]) {
            tpoint = (90-(pinning[i]*10))/90;

            translate([0,0,4+(3.1*i)])
            if ( $t > tpoint ) {
                rotate([0,0,(pinning[i]*10)*($t-tpoint)/(1-tpoint)])
                disk(pinning[i]);
            } else {
                //disk(pinning[i]);
            }
        }

        body();

        translate([0,0,3])
        rotate([0,0,90*$t])
        key();
    }
}

animation();

translate([0,50,0])
rotate ([0,0,90])
animation();
