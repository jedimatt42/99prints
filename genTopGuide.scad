
difference() {

    // base
    union() {
        // broad plate
        cube([30,20,2],true);

        // rise cube
        translate([0,0,3])
        cube([30,6,4.5],true);
    }


    translate([0,0,5])
    cube([30,1.6,4],true);

}