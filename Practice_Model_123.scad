$fn = 100;
mm = 1;
degree = 1;
diameter = .5;
angleOffset = 90;
use <library.scad>

innerRadius = 60 * diameter;
outerRadiusTop      = 140 * diameter;
outerRadiusmiddle   = 110 * diameter;
outerRadiusbottum   = 80 * diameter;
cylHeight           = 20;
cylBottumHeight     = 60;
PlateHeight         = 20;
PlateWidth          = 80;
height              = 180;



translate([0,0, cylBottumHeight + cylHeight])
    anulus( outerRadiusTop, innerRadius, cylHeight);//Top

translate([0,0, cylBottumHeight])
    anulus( outerRadiusmiddle, innerRadius, cylHeight);//Middle

anulus( outerRadiusbottum, innerRadius, cylBottumHeight);//Bottum



    OuterRadiusRotate = 20;
    innerDiameterRotate = 25 * diameter;
    cylHeightRotate = 40;
    cubeHeight = 110;

rotate([90, 0, 0])
translate([-cubeHeight, OuterRadiusRotate, -OuterRadiusRotate])
    anulus( OuterRadiusRotate, innerDiameterRotate, cylHeightRotate);//Bottum

difference(){    
    translate([-cubeHeight, OuterRadiusRotate, OuterRadiusRotate])
    rotate([90, 0, 0])
        anulus_body(OuterRadiusRotate, innerDiameterRotate, cylHeightRotate, cubeHeight);
    
    anulus( outerRadiusbottum, 0, cylBottumHeight);//Bottum
}
    anulus( outerRadiusbottum, cylBottumHeight, cylBottumHeight);//Bottum


PlateRadiusCut = 15;
betterCenterDis = 40;

difference(){
    anulus_body( outerRadiusbottum, innerRadius, PlateHeight, height);//BasePlate
    translate([ height - betterCenterDis, 0, 0])
        anulus_hull(PlateRadiusCut, 0, PlateHeight, betterCenterDis);
    }

