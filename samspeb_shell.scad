
module pcboard() {
    
    translate([2,1,7-1])
    linear_extrude(height=2)
    polygon(points=[
      [2,6],
      [58,6],
      [58,12],
      [62,12],
      [62,0],
      [141,0],
      [141,12],
      [145,12],
      [145,6],
      [197,6],
      [197,109],
      [2,109],
      [2,96],
      [-10,96],
      [-10,41],
      [2,41]
    ]);
}

//nofill=1;
print_top=1;
print_bottom=0;
led_height=25;

test=0;

include <peb_shell.scad>;