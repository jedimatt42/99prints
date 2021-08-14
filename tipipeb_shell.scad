
module pcboard() {
    
    translate([4,1,7-1])
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
      [197,77],
      [209,77],
      [209,145],
      [-10,145],
      [-10,39],
      [2,39]
    ]);
}

//nofill=1;
print_top=0;
print_bottom=1;
led_height=25;

test=0;

include <peb_shell.scad>;