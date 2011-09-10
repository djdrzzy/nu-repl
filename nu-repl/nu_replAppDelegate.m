//
//  nu_replAppDelegate.m
//  nu-repl
//
//  Created by Daniel Drzimotta on 11-09-02.
//  Copyright 2011 Soma Creates. All rights reserved.
//

#import "nu_replAppDelegate.h"

#import "RemoteMessageInterface.h"
#import "Nu.h"

@interface nu_replAppDelegate () <RemoteMessageInterfaceDelegate>
@property (nonatomic, readwrite, retain) RemoteMessageInterface *rmi;
@end

@implementation nu_replAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize rootViewController;

@synthesize rmi;

-(NSString*) remoteMessageInterface:(RemoteMessageInterface*)interface
                    receivedMessage:(NSString*)message {
    
    id parser = [Nu sharedParser];
    
    id code = nil;
    id result = nil;
    
    @try {
        code = [parser parse:message];
    }
    @catch (NSException *exception) {
        return [NSString stringWithFormat:@"%@", exception];
    }
    
    @try {
        result = [parser eval:code];
    }
    @catch (NSException *exception) {
        return [NSString stringWithFormat:@"%@", exception];
    }
    
    return [NSString stringWithFormat:@"%@", result];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [[Nu sharedParser] eval:
     [[Nu sharedParser] parse:@"(function test-output () \"You should update me!\")"]];
    
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    self.rmi = [[[RemoteMessageInterface alloc] init] autorelease];
    self.rmi.delegate = self;
    
    [self.rmi startOnSocket:40000];
    
    self.rootViewController.ipAddressLabel.text = [NSString stringWithFormat:@"%@:%@", 
                                                   [self.rmi getIPAddress], 
                                                   [self.rmi port]]; 
    

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    
    self.rmi = nil;
    [super dealloc];
}

@end
