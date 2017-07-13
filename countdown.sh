!/usr/bin/env bash
fun=true
if [[ $(uname -s)=="Darwin" ]]; then
  if command -v brew >/dev/null; then
    if ! [[ $(brew ls --versions cowsay) > /dev/null ]]; then
      brew install cowsay > /dev/null
    fi
  else # Homebrew not installed
  fun=false
  fi
fi

specialTime=1500000000
while (($(date +%s)<$specialTime )); do
  time=$(date +%s)
  remaining=$(($specialTime-$time))
  echo -en "\r Countdown: $remaining"
done
echo -en "\r"

message="Party hard!"
if [[ fun ]]; then
  echo $message | cowsay -f tux
else
  echo $message
fi
