#!/bin/bash

# Replace these variables with your own Bitwarden credentials
BITWARDEN_EMAIL="yanboyang713@gmail.com"
BITWARDEN_PASSWORD="WALK[my]cat2019"

# Login to Bitwarden and capture the session key
BW_LOGIN_OUTPUT=$(bw login $BITWARDEN_EMAIL $BITWARDEN_PASSWORD)

# Extracting the BW_SESSION string using pattern matching and parameter expansion
if [ $? -eq 0 ] && [[ $BW_LOGIN_OUTPUT =~ BW_SESSION=\"([^\"]+)\" ]]; then
    echo "Bitwarden login successful!"
    echo "Output: $BW_LOGIN_OUTPUT"
    bw_session="${BASH_REMATCH[1]}"
    echo "bw session key: $bw_session"  # Outputs "Tp2zk7AMyZif6d6iQZcM99TaSOPxdNPi67DydWuN0suMgbvHW0OJrW2W6FV8RFnk2lLu9xI4vxyV84hY+mQp2g=="
else
  echo "Bitwarden login failed!"

fi
