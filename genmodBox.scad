sw_x=20;
sw_y=13;
sw_z=20;

sh_x=65;
sh_y=25;
sh_z=25;

$fn=12;

module switch() {
    cube([sw_x,sw_y,sw_z]);
}

module led() {
    cylinder(h=sw_z,r=1.5,center=false);
}

module switch_plus_led() {
    switch();
    
    translate([25,sw_y/2,0])
    led();
}

module junk_in_the_box() {
    translate([5,5,-1])
    union() {
        switch_plus_led();
        
        translate([30,0,0])
        switch_plus_led();
    }
    
    translate([35,sh_y-3,1])
    cube([6,2,30]);
}

module shell() {
    difference() {
        cube([sh_x,sh_y,sh_z]);
        
        translate([1,1,1])
        cube([sh_x-2,sh_y-2,sh_z-2]);
    
        junk_in_the_box();
    }
}

module base() {
    difference() {
        shell();
        
        translate([0,0,sh_z-5])
        cube([sh_x,sh_y,5]);
    }
}

module lid() {
    translate([0,-10,25])
    rotate([180,0,0])
    union() {
        difference() {
            shell();
            
            cube([sh_x,sh_y,20]);
        }
           
        translate([1,1,19])
        cube([5,1,3]);
        
        translate([59,1,19])
        cube([5,1,3]);
        
        translate([1,sh_y-2,19])
        cube([5,1,3]);
        
        translate([59,sh_y-2,19])
        cube([5,1,3]);        
    }
}

base();

lid();