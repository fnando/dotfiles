if [[ -d "/Applications/Android Studio.app/Contents/jre/Contents/Home" ]]; then
  export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"
elif [[ -d "/Applications/Android Studio.app/Contents/jbr/Contents/Home" ]]; then
  export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
fi

if [[ "$JAVA_HOME" != "" ]]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH="$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$HOME/Library/Android/sdk/emulator:$HOME/Library/Android/sdk/tools/bin:$PATH"
fi
