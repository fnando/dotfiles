if [[ -d "/Applications/Android Studio.app/Contents/jre/Contents/Home" ]]; then
  export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"
elif [[ -d "/Applications/Android Studio.app/Contents/jbr/Contents/Home" ]]; then
  export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
fi

if [[ "$JAVA_HOME" != "" ]]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
  _prepend-path "$JAVA_HOME/bin"
  _prepend-path "$ANDROID_HOME/cmdline-tools/latest/bin"
  _prepend-path "$ANDROID_HOME/platform-tools"
  _prepend-path "$HOME/Library/Android/sdk/emulator"
  _prepend-path "$HOME/Library/Android/sdk/tools/bin"
fi
