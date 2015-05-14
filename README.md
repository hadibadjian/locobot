# Locobot
A simulation of a toy robot moving on a square tabletop of 5x5 dimension.

## Usage
Configure the robot with appropriate input parser:

- JSON Parser
```ruby
  Locobot::Config.input_parser = Locobot::Parser::JSONParser.new
  Locobot::Config.command_separator = '->'
```

- File Parser
```ruby
  Locobot::Config.input_parser = Locobot::Parser::FileParser.new
```

Define the robot input commands, respectively:

- JSON input
```ruby
  input = "{ \"commands\": \"PLACE 5, 5, NORTH -> MOVE -> LEFT -> RIGHT -> REPORT\" }"
```

- File input
```ruby
  input = '/file/path/file_parser_sample_1.txt'
```

Feed the input and run the robot!
```ruby
  Locobot::Config.input_parser.read input
  Locobot::Core.new.run
```

## Versions
### v0.1.0
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
