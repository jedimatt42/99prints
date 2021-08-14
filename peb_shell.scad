testp=(undef == test) ? 1 : test;

// Set led_height if 'tipi' or other odd board
// set print_bottom=1 to render bottom of shell
// set print_top=1 to render top of shell

module reliefPoint() {
    sphere(r=3);

    translate([0,0,22])
    sphere(r=3);
}

module vertReliefPoints() {
    for (iy = [15:30:140]) {  
        translate([0,iy,0])
        reliefPoint();
    }
}

module horizReliefPoints() {
    for (ix = [15:33:185]) {
        translate([ix,0,0])
        reliefPoint();
    }
}

module case_template(drill) {
    difference() {
        cube([195,151.5,22]);
      
        translate([61,-1,2])
        cube([89,20,10]);  
        
        translate([2,2,2])
        difference() {
            cube([191,143,18]);
            
            cube([8,10,18]);
            
            translate([191-8,0,0])
            cube([8,10,18]);
            
            translate([191-8,146-10,0])
            cube([8,10,18]);
            
            translate([0,146-10,0])
            cube([8,10,18]);
        }
        
        lh = led_height ? led_height : 25;
        translate([0,lh,10])
        rotate([0,90,0])
        cylinder(h=6,d=6,center=true,$fn=20);
        
        translate([0,lh-3,7.0])
        cube([6,6,3]);
        
        vertReliefPoints();
        
        translate([195,0,0])
        vertReliefPoints();
        
        horizReliefPoints();
        
        translate([0,150,0])
        horizReliefPoints();
        
        translate([3.5,3.5,0])
        cylinder(h=50,d=drill,center=true,$fn=10);
        
        translate([3.5,151.5-3.5,0])
        cylinder(h=50,d=drill,center=true,$fn=10);

        translate([195-3.5,3.5,0])
        cylinder(h=50,d=drill,center=true,$fn=10);
        
        translate([195-3.5,151.5-3.5,0])
        cylinder(h=50,d=drill,center=true,$fn=10);
    }
}

module reduced_plane() {
    translate([10,10,0])
    intersection() {
        for(iy = [0:30:250]) {
            for(ix = [0:30:250]) {
                translate([ix,iy,0])
                cylinder(h=80,d=25,center=true,$fn=20);
            }
        }

        cube([195-20,150-20,40]);
    }
}

module bottom() {
    difference() {
        case_template(3);
        
        pcboard();
        
        reduced_plane();
        
        translate([0,0,7])
        cube([195,155,22]);
    }
}

module top() {
    difference() {
        case_template(3.5);
      
        pcboard();
        
        reduced_plane();

        cube([195,155,7]);
    }
}

if (print_bottom||testp) {
    translate([0,5,0])
    bottom();
}

if (print_top||testp) {
    rotate([180,0,0])
    translate([0,5,-22])
    top();
}
