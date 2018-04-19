# Tornado

Goal: make tornadoes out of particles with interesting behaviours

## TODO

- CODE CLEANUP!!!
	+ comment variables and methods
- make some of the particles have a trail
	+ extend the particle class to have a type with trail
	+ extend the particle class to have a type that is only trail
- make the room wrapping instead of walled?
- add lighting?
- make 2 display for particles: one with the depth and one with that calculate the depth?

## DONE

- tornadoes are made out of particles
- tornadoes have a rotation speed, a height, a position and a hue
- particles can have slightly off speed from their tornado, this affect the hue too
- the height of a tornado affects the amount of particles
- the tornado's shape is somewhat curved, not just a cone
- particles are affected by perlin noise, it is stronger the lower it is. This somewhat ressembles a tornado. (Can be improved)
- tornadoes can spin either way and can be moved, there can be more than one tornado
- strokeWeight changes based on z
- tornadoes move using perlin noise
- added tornado collision with invisible walls and other tornadoes (Can be improved)
- made the camera pan, recalculated size of dots based on camera distance instead of z. the size is calculated for the tornado rather then each dot now
