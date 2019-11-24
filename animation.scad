include <parameters.scad>
use <disk.scad>
use <body.scad>
use <key.scad>

module animation() {
    union() {
        for (i=[0:len(pinning)-1]) {
                if( (pinning[i]*20) < 90*$t )
                    translate([0,0,5+(4*i)])
                    rotate([0,0, (90*$t)-pinning[i]*20])
                    disk(pinning[i]);
                else
                    translate([0,0,5+(4*i)])
                    disk(pinning[i]);
        }

        body();

        
        rotate([0,0,90+90*$t])
        translate([2.25,0,3])
        key();

       // translate([0,0,3*len(pinning)+7])
       // rotate([0,180,180])
       // shell();
    }
}

animation();

/*
translate([0,50,0])
rotate ([0,0,90])
animation();
*/