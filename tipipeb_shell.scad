
module pcboard() {
    
    translate([0,0,7-1.6])
    linear_extrude(height=1.6)
    polygon(points=[
      [2,7],
      [58,7],
      [58,12],
      [62,12],
      [62,0],
      [141,0],
      [141,12],
      [145,12],
      [145,7],
      [197,7],
      [197,77],
      [209,77],
      [209,145],
      [-10,145],
      [-10,40],
      [2,40]
    ]);
}

print_top=1;
print_bottom=1;
led_height=15;

include <peb_shell.scad>;