#### Description
##
## This is loaded from the app delegate once the program starts up. Once it has
## started you can edit the functions and whatever you want in here and then
## send the expressions over to the device to immediately see the results using
## our handy-dandy automator action. The good thing about this approach is that
## when the program loads up the next time it will load the code that you have
## edited and tested below. All the code is as expected.


(set x 1)

(function test-output ()
    "You should update me!")


## For example uncomment and test out the function below:
#(function test-output ()
#    (set x (+ x 1))
#    "hey hey hey" + x)