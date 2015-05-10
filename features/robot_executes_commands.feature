Feature:
  In order to move
  A robot
  Should be able to parse commands correctly

  Background:
    Given the robot is configured

  Scenario Outline: Parse commands
    Given the robot is at <init_position>
    And the command is <command>
    When the robot runs the command
    Then the robot position should be <final_position>

    Examples:
      | init_position   | command              | final_position  |
      | [0, 0, "NORTH"] | PLACE(5, 5, "NORTH") | [0, 0, "NORTH"] |
      | [0, 0, "NORTH"] | PLACE(3, 3, "SOUTH") | [3, 3, "SOUTH"] |
      | [0, 0, "NORTH"] | PLACE(2, 1, "EAST")  | [2, 1, "EAST"]  |
      | [1, 1, "NORTH"] | PLACE(3, 0, "WEST")  | [3, 0, "WEST"]  |
      | [0, 0, "NORTH"] | MOVE                 | [0, 1, "NORTH"] |
      | [0, 0, "SOUTH"] | MOVE                 | [0, 0, "SOUTH"] |
      | [0, 0, "EAST"]  | MOVE                 | [1, 0, "EAST"]  |
      | [0, 0, "WEST"]  | MOVE                 | [0, 0, "WEST"]  |
      | [0, 0, "NORTH"] | LEFT                 | [0, 0, "WEST"]  |
      | [0, 0, "WEST"]  | LEFT                 | [0, 0, "SOUTH"] |
      | [0, 0, "SOUTH"] | LEFT                 | [0, 0, "EAST"]  |
      | [1, 4, "EAST"]  | LEFT                 | [1, 4, "NORTH"] |
      | [0, 0, "NORTH"] | RIGHT                | [0, 0, "EAST"]  |
      | [0, 0, "WEST"]  | RIGHT                | [0, 0, "NORTH"] |
      | [0, 0, "SOUTH"] | RIGHT                | [0, 0, "WEST"]  |
      | [1, 4, "EAST"]  | RIGHT                | [1, 4, "SOUTH"] |
      | [0, 0, "NORTH"] | REPORT               | [0, 0, "NORTH"] |
