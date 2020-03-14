$fn=60;

module case() {
  difference(){
    union(){
      rotate([0,90,90]) translate([0,0,-2]) cylinder(d=12, h=4); // lens holder
      translate([0,-15,-7]) cylinder(d=32, h=14); // main body cyl solid 
    }
    rotate([0,90,90]) translate([0,0,-3]) #cylinder(d=10.85, h=6); // lens hole
   
    for ( i = [ 12, -32 ] ){ // main cyl cuts
      translate([i,-32,-10]) cube([20,40,20]); 
    }
    
    translate([0,-15,-5]) #cylinder(d=28, h=12); // main body cyl space
    translate([-2,-32,3]) #cube([4,4,4]);       // wire hole
      
  }
  difference(){
    for ( i = [ 10, -12 ] ){ 
      translate([i,-25,-7]) #cube([2,20,13]); // walls 
    }
    translate([-15,-15,0]) rotate([0,90,0]) #cylinder(d=2, h=30);   
  }
}

module cap() {
  difference(){
    translate([0,-15,6]) cylinder(d=32, h=1);
    case();
   for ( i = [ 12, -32 ] ){ // main cyl cuts
      translate([i,-32,-10]) cube([20,40,20]); 
    }
  }
}

case();
translate([30,0,-13]) cap();
translate([-32,0,5]) pivot(9);
translate([-64,0,5]) pivot();

module pivot(add=0){
  difference(){
    union(){
      translate([0,-15,-12]) cylinder(d=32, h=2);
      hull(){
        translate([-14,-22,-12]) cube([2,14,2]);
        translate([-14,-15,add]) rotate([0,90,0]) #cylinder(d=5, h=2);
      }
      hull(){
        translate([12,-22,-12]) cube([2,14,2]);
        translate([12,-15,add]) rotate([0,90,0]) #cylinder(d=5, h=2);
      }
    }
    translate([-15,-15,0+add]) rotate([0,90,0]) #cylinder(d=2, h=30);
    translate([0,-15,-12]) cylinder(d=2, h=2);  
    for ( i = [ 14, -34 ] ){ // main cyl cuts
      translate([i,-32,-10]) cube([20,40,20]); 
    }
  }
}