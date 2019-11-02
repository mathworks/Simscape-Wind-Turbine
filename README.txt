Here are some key points about this demonstration model.

1. You must open project "Wind_Turbine.prj" to set the path and load key values.

2. You may need a supported compiler.
	http://www.mathworks.com/support/compilers/current_release/

3. Some configurations are invalid.  
   Turbine Inputs, Blade Loads, Main Controller, and Pitch Controller must be compatible

	Valid combinations:	
	Turbine Inputs	Main Controller	Blade Loads	Pitch Controller
	Commands	Direct Input	Torque		Inner Loop
	(all other)	Wind Input	(not Torque)	PI on AoA

4. Wind_Turbine_Demo_Script.html will walk you through most parts of the wind turbine demo.  

5. The model Wind_Turbine_Flexible_Blades.slx is not built to be 
attached to Wind_Turbine.slx.  It is proof of concept only.

Copyright 2009-2019 The MathWorks, Inc.
