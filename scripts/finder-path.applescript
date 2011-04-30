tell application "Finder"
	set theWindow to window 1
	set thePath to (POSIX path of (target of theWindow as alias))
	do shell script "echo " & thePath
end tell
