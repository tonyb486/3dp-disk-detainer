include <parameters.scad>
use <disk.scad>
use <body.scad>
use <key.scad>

module animation() {
    union() {
        for (i=[0:len(pinning)-1]) {
                if( (pinning[i]*20) < 90*$t )
                    translate([0,0,5+(3*i)])
                    rotate([0,0, (90*$t)-pinning[i]*20])
                    disk(pinning[i]);
                else
                    %translate([0,0,5+(3*i)])
                    disk(pinning[i]);
        }

        body();

        translate([0,.25,3])
        rotate([0,0,90+90*$t])
        key();
    }
}

animation();

/*
translate([0,50,0])
rotate ([0,0,90])
animation();
*/