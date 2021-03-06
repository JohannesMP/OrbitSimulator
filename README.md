# KeplerOrbitSimulator2D
A 2-Dimensional Kepler orbit simulator that allows uses to input orbital state vectors and relevant constants that define an orbit about a central fixed body, neglecting the mass of the satellite

KeplerOrbitSimulator2D simulates a Kepler Orbit under the following schema:  

* calculates elements of a kepler orbit including eccentricity, true anomaly, etc.
* constructs a kepler orbit as a polar function of the true anomaly
* uses newton's method to extrapolate for the eccentric anomaly as a function of time
* extrapolates the next true anomaly from this information
* plots the position of the satellite using the polar function defining the radius vector from the fixed body to the satellite

## User Manual

### Setting Up a User Defined Orbit:
1. stop the simulation by clicking/tapping the start/stop button  
2. set the recalculate option to true by clicking/tapping the recalculate button  
3. adjust the parameters using the 1d sliders for constants and/or scalars or the 2d sliders for state vectors
4. set recalculate to false (this is not necessary but recommended)  
5. set start/stop to true to run the simulation

### Adjusting run-time values (time step and radii):
1. Simply drag the sliders for these values left or right to alter their values; changes will take effect immediately

### Notes:
* Buttons are in the true state when light blue is towards the left  
* Under the hood, the y axis and positive angular direction are inverted

![Screenshot](https://github.com/MeadeRobert/OrbitSimulator/blob/master/images/1945_3_6_17.PNG)  

## Javadoc  
[http://rjm27trekkie.chickenkiller.com/OrbitSimulator/doc](http://rjm27trekkie.chickenkiller.com/OrbitSimulator/doc)


