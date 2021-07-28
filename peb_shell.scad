//test=1;

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

module case_template() {
    difference() {
        cube([195,150,22]);
      
        translate([62,-1,2])
        cube([87,20,10]);  
        
        translate([2,2,2])
        difference() {
            cube([191,146,18]);
            
            cube([4,10,18]);
            
            translate([191-4,0,0])
            cube([4,10,18]);
            
            translate([191-4,146-10,0])
            cube([4,10,18]);
            
            translate([0,146-10,0])
            cube([4,10,18]);
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
    }
}

module reduced_plane() {
    translate([20,20,0])
    difference() {
        cube([195-40,150-40,22]);

        rotate([0,0,-45])
        translate([-200,0,0])
        union() {
            for(iy = [5:20:250]) {
                translate([0,iy,0])
                cube([400,15,22]);
            }
        }
    }
}

module bottom() {
    difference() {
        case_template();
        
        pcboard();
        
        translate([0,0,7])
        cube([195,150,22]);
        
        reduced_plane();
    }
}

module top() {
    difference() {
        case_template();
      
        pcboard();

        cube([195,150,7]);
        
        reduced_plane();
    }
}

if (print_bottom||test) {
    translate([0,5,0])
    bottom();
}

if (print_top||test) {
    rotate([180,0,0])
    translate([0,5,-22])
    top();
}
