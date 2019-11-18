include <parameters.scad>
use <disk.scad>
use <body.scad>
use <key.scad>

module animation() {
    union() {
        color("green")
        for (i=[0:len(pinning)-1]) {
                translate([0,0,5+(3*i)])
                rotate([0,0,(90-(pinning[i]*10))*$t])
                disk(pinning[i]);
        }

        body();

        //translate([0,0,3])
        //rotate([0,0,90*$t])
        //key();
    }
}

animation();

/*
translate([0,50,0])
rotate ([0,0,90])
animation();
*/