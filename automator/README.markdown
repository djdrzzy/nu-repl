Included are any app specific automator actions and services that I have found
handy.

There should be only one so far. It is used to highlight any text in any
application and then send the text to an existing nu-repl on some device. It
looks for the file:

~/.nu-repl-location

for the address of the device on the same network and then sends the text over
on port 40005.

It's probably handy to assign a keyboard shortcut to it.

You should see the output of the action on the console.