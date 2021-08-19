
module hook(y,c=0) {
    union() {
        cube([4,4,18]);
        
        translate([0,0,18])
        cube([4,y,3]);
        
        if (c==1) {
            translate([-1,0,0])
            cube([1,y,19]);
        }
        if (c==2) {
            translate([4,0,0])
            cube([1,y,19]);
        }
    }
}

module assembly() {
rotate([90,0,0])
    union() {
        cube([90,20,1]);
        
        cube([90,1,10]);

        translate([0,0,0])
        hook(12,1);

        translate([20,0,0])
        hook(12);

        translate([86,0,0])
        hook(8,2);
    }
}

difference() {
    assembly();
    
    translate([12,-10,0])
    cylinder(h=3,d=15,center=true);
}