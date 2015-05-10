# Locobot
A simulation of a toy robot moving on a square tabletop of 5x5 dimension.

# Versions
## v0.1.0
### Requirements
- No obstructions on the table
- The robot is free to roam around on the table
- The robot should not fall to destruction.
  + ignore any command that would result in the fall
  + continue with the next valid command
- The robot should receive an initial placement position
  + (0, 0) is the south west corner
- The robot should receive valid movement commands.
  + valid commands are:
    * PLACE(x, y, face): Position the robot at point _(x, y)_, facing towards _face_.
    * MOVE: Move the robot one unit forward. (Ignored if robot is not on the tabletop).
    * LEFT: Rotate robot 90 degrees to the left. (Ignored if robot is not on the tabletop).
    * RIGHT: Rotate robot 90 degrees to the right. (Ignored if robot is not on the tabletop).
    * REPORT: Report current position of the robot. (Ignored if robot is not on the tabletop).
  + any commands before the initial PLACE must be ignored
  + multiple PLACE commands is valid
- The robot should read commands and execute them sequentially
