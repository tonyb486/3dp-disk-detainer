include <parameters.scad>
use <disk.scad>
use <body.scad>
use <key.scad>

// Lock Body
body();

// Shell
translate([75,25,0])
shell();

// Sidebar
translate([10,15,0])
cylinder(r=1.5, h=len(pinning)*4+1);

// Key
translate([0,25, (len(pinning)*4)+9])
rotate([0,180,90])
key();

// Disks
for (i=[0:len(pinning)-1]) {
    translate([24*(1+floor(i/2)),23*(i%2), 0])
    disk(pinning[i]);
}


