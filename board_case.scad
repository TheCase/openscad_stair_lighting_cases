$fn=60;


module case(){
  difference(){
    cube([50,32,14]);
    translate([2,2,2]) cube([46,28,12]);   
    translate([42,3,7.5]) rotate([90,90,0]) #cylinder(d=11, h=4);
    translate([0,20,10]) #cube([50,4,4]);
  }
  translate([-6,16,12]) ear();
  translate([56,16,12]) mirror() ear();
}

module ear(){
  difference(){
    union(){
      translate([]) cylinder(d=6, h=2);
      translate([0,-3,0]) cube([8,6,2]);
    }
    translate([]) cylinder(d=2, h=2);
  }
}

case();