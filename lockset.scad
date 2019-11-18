include <parameters.scad>
use <disk.scad>
use <body.scad>
use <key.scad>

// Lock Body
body();

// Key
translate([0,25, (len(pinning)*3)+9])
rotate([0,180,90])
key();

// Disks
for (i=[0:len(pinning)-1]) {
    translate([25*(1+floor(i/2)),25*(i%2), 0])
    disk(pinning[i]);
}
