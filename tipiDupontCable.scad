// connectors to make there be only one 
// obvious right way to attach a TIPI
// cable to the RPi, and TIPI pcb.


oxf_x = 12.95;
oxf_y = 2.85 * 2 + 0.2;
oxf_z = 14;

module sheath() {
    difference() {
        cube([oxf_x + 1, oxf_y + 1, oxf_z]);

        translate([0.5,0.5,0])
        cube([oxf_x, oxf_y, oxf_z]);
    }
}

module tipi_end() {
    union() {
        sheath();
        
        w = 4;
        offset = (oxf_x + 1) / 2 - (w/2);
        translate([offset,-2,0])
        cube([w,2,4]);
    }
}

module rpi_end() {
    union() {
        sheath();
        
        translate([oxf_x+1,0,0])
        cube([2,oxf_y + 1,4]);
    }
}

rpi_end();

translate([0,oxf_y*3,0])
tipi_end();