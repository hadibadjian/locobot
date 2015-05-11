Feature:
  In order to process movement commands
  A robot
  should be able to receive movement commands

  Background:
    Given the robot is configured

  Scenario Outline: Receive commands
    Given the input is comma separated command <command>
    When the robot receives the input
    Then the processed command list should contain <count> commands

    Examples:
    | command                                               | count |
    | PLACE                                                 | 0     |
    | MOV                                                   | 0     |
    | LEFTX                                                 | 0     |
    | RPORT                                                 | 0     |
    | PLACE(1, 1, NORT)                                     | 1     |
    | PLACE(1, 1, NORTH) -> RPORT                           | 1     |
    | PLACE(1, 1, NORTH)                                    | 1     |
    | PLACE(1, 1, SOUTH)                                    | 1     |
    | PLACE(1, 1, EAST)                                     | 1     |
    | PLACE(1, 1, WEST)                                     | 1     |
    | PLACE(5, 5, NORTH)                                    | 1     |
    | MOVE                                                  | 1     |
    | LEFT                                                  | 1     |
    | RIGHT                                                 | 1     |
    | REPORT                                                | 1     |
    | PLACE(5, 5, NORTH) -> MOVE -> LEFT -> RIGHT -> REPORT | 5     |
    | MOVE -> RIGHT -> LEFT -> REPORT                       | 4     |
    | LEFT -> LEFT -> LEFT -> MOVE                          | 4     |
