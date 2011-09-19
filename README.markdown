README
======

What Is This?
-------------

It is something I've made to help play around with and learn Nu (http://programming.nu/). My motivation for this was to be able to work on scripts within a project and then immediately use a key combination to send the new code over to the device to be immediately tested without recompiling. Nu works beautifully with Objective-C and has awesome script capabilities so I decided to go with that.

It is Mac OS X / iOS specific. 

How Do I Use This?
------------------

You can test out the example target to test it out on a device.

Before that happens though you must install the automator service that is included. This is what allows you to highlight text in any program and then send the text over to the device to be evaluated. You can either right-click to use the service or assign a key combination by going to the "Keyboard" settings in "System Preferences".

You must set a file up at "~/.nu-repl-location" including only the ip address of the device on your local network. The automator service depends on this and will not work without it.

Once on the device you can play with the two scripts included in the project. "main.nu" is what is used once the program starts up. "scratch.nu" is just something to play around with. You can highlight the code and then send it over with the key combination you have chosen or through the right-click method.

In the console it will log the input that you have sent and the output from the evaluation of that input.

If you want to see results on the main screen of the app you can modify the "test-output" method in "main.nu".

You can also link to a static library for use in other projects.

Linking To The Static Library
-----------------------------

Be sure to include the "CFNetwork.framework" when linking. Also remember to add "NuREPLController.h" to your header search path.