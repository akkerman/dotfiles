#!/bin/bash
  # This script is in the public domain.  Owning rights to such a simple script
  # is pointless.
  
  
  # Note! If you keep trying to open your favorite terminal but all you get is
  # xterm, it is because the specific terminal was not tested with this script
  # and the default is xterm.  Modify this script by searching for
  # "case $PROGRAM" and add your terminal to the check.
  
  
  # TODO: make these command line options
  PROGRAM=${PROGRAM:-xterm}
  
  # 0 - false - count starts at 1
  # 1 - true - count starts at 0
  START_ZERO=${START_ZERO:-1}
  
  # Title will be <TITLE_PREFIX><NEXT>
  TITLE_PREFIX=${TITLE_PREFIX:-}
  
  # ----------------------------------
  # Process Options
  # ----------------------------------
  # Determine terminal and title command.
  case $PROGRAM in
    # These have been tested to all accept the same command
    # Fix as needed.
    *xterm|rxvt|Terminal)
      TITLE_CMD=" -T "
      ;;
    *)
      PROGRAM=xterm
      TITLE_CMD=" -T "
      ;;
  esac
  
  # Set the decrement value
  case $START_ZERO in 
    1|true)
      DECREMENT=1
      ;;
    0|false)
      DECREMENT=0
      ;;
    *)
      DECREMENT=1
      ;;
  esac
  
  
  # ----------------------------------
  # Count number of terminals
  # ----------------------------------
  # Command always outputs 1 more than number open
  CURRENT=$(ps -C $PROGRAM u | wc -l)
  # The above command counts 1 for us and starts at 1.
  # We must subtract 1 to start at 0.
  # If we did not, we would start at 1.
  let "NEXT = CURRENT - DECREMENT" 
  
  # ----------------------------------
  # Execute our command and send to background
  # ----------------------------------
  ${PROGRAM}${TITLE_CMD}${TITLE_PREFIX}${NEXT} &
