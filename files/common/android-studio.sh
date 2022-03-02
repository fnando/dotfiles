if [[ -d "/Applications/Android Studio.app" ]]; then
  export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH="$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$HOME/Library/Android/sdk/emulator:$HOME/Library/Android/sdk/tools/bin:$PATH"
fi
