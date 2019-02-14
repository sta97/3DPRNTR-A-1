stepper_hole_offset = 31/2;
stepper_hole_diam = 3;
wall_thickness = 5;;
extrusion_side_length = 25;
extrusion_hole_gap = wall_thickness*3;

wall_width = 200;
wall_height = 200;

translate([0,25+wall_thickness/2,0]) side_panel();
translate([0,-25-wall_thickness/2,0]) side_panel();
connecting_panels();

module connecting_panels() {
    difference(){
        cube([50,50,wall_thickness],true);
        stepper_holes();
    }
}

module side_panel() {
    difference() {
        cube([wall_width,wall_thickness,wall_height],true);
        translate([0,0,-extrusion_side_length/2-10]) extrusion_holes();
        translate([0,0,25+wall_thickness/2]) cube([10,wall_thickness+1,50],true);
    }
}

module extrusion_holes() {
    translate([extrusion_side_length/2+extrusion_hole_gap/2,0,0]) extrusion_hole();
    translate([-extrusion_side_length/2-extrusion_hole_gap/2,0,0]){ extrusion_hole();
        translate([0,0,-extrusion_side_length/2-10.5]) 
}

module bracket_hole() {
    rotate([90,0,0]) cylinder(h=wall_thickness+1,d=5,center=true);
}

module extrusion_hole() {
    cube([extrusion_side_length,wall_thickness+1,extrusion_side_length],true);
}

module stepper_holes() {
    translate([stepper_hole_offset,stepper_hole_offset,0]) stepper_hole();
    translate([-stepper_hole_offset,stepper_hole_offset,0]) stepper_hole();
    translate([-stepper_hole_offset,-stepper_hole_offset,0]) stepper_hole();
    translate([stepper_hole_offset,-stepper_hole_offset,0]) stepper_hole();
}

module stepper_hole() {
    cylinder(h=wall_thickness+1,d=stepper_hole_diam,center=true);
}