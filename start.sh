#!/bin/bash
 echo "Running entrypoint script ! "
 
if [[ -z "$SPRING_PROFILES_ACTIVE" ]]; then
  echo "Warning:  using default : SPRING_PROFILES_ACTIVE"
  export SPRING_PROFILES_ACTIVE='local'
fi

set jasyptPassword=$jasyptPassword
java -jar -Dspring.profiles.active=$SPRING_PROFILES_ACTIVE app.jar