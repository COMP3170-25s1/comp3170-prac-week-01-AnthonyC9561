#version 410

uniform vec3 u_colour;			// colour as a 3D vector (r,g,b)
uniform vec2 u_screenSize;  	// screen dimensions in pixels

layout(location = 0) out vec4 o_colour;	// output to colour buffer

void main() {
	bool widthLarger = true; //whether width is larger or not

	if(u_screenSize[0] > u_screenSize[1]) { //if statements for uniform at later points in the code results in error of unable to locate uniform variable, flag used to determine which window dimension is bigger
		larger = true;
	}
	else {
		larger = false;
	}
	
	float maxSize = max(u_screenSize[0], u_screenSize[1]);
	float minSize = min(u_screenSize[0], u_screenSize[1]);
	
	vec2 p = gl_FragCoord.xy / minSize;   // scale p into range (0,0) to (1,1)
    //float d = distance(p, vec2(0.5, 0.5));     // calculate distance to midpoint
    vec2 v = vec2(0,0);

	if(widthLarger) { //determines which side of the window is bigger, then rescale the to ensure it prevents the shape from stretching
		v = abs(p - vec2(0.5*(maxSize/minSize), 0.5));//gets p, relative to the chosen centre point (0,5, 0.5)
	}
	else {	
		v = abs(p - vec2(0.5, 0.5*(maxSize/minSize)));//gets p, relative to the chosen centre point (0,5, 0.5)
	}
	
	//float d = max(v.x, v.y); //this set d to be the larger value of the 2, creates a square
	
	float d = v.x + v.y; //this creates a diamond, resembles a linear equation 
	
    if (d < 0.25 ) {
    	o_colour = vec4(u_colour, 1);
    }
   else {
      o_colour = vec4(0,0,0,1); // BLACK
   }
}