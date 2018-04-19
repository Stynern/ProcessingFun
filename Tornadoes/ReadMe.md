# Tornado

Goal: make tornadoes out of particles with interesting behaviours

## TODO

- code cleanup?
- add a way to select how much of each type a mixed tornado should have?
- make the room wrapping instead of walled?
- add lighting?
- make 2 display for particles: one with the depth and one with that calculate the depth?

## DONE

- tornadoes are made out of particles, they have:
	+ a rotation speed,
	+ a height,
	+ a position,
	+ a hue
- particles can have slightly off speed from their tornado, this affect the hue too
- the height of a tornado affects the amount of particles
- the tornado's shape is somewhat curved, not just a cone
- particles are affected by perlin noise, it is stronger the lower it is. This somewhat ressembles a tornado's behaviour. (Can be improved)
- tornadoes can spin either way (clockwise or anti-clockwise) and can be moved, there can be more than one tornado
- tornadoes move using perlin noise
- added tornado collision with invisible walls and other tornadoes (Can be improved)
- made the camera pan, recalculated size of dots based on camera distance instead of z. The size is calculated for the tornado rather then each dot now.
- there are 3 type of particles
	+ simple particles, spin around in the tornado
	+ rising particles, go up while spining
	+ trailing particles, only trails in the tornado
