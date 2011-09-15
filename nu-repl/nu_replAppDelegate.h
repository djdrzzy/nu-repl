//
//  nu_replAppDelegate.h
//  nu-repl
//
//  Created by Daniel Drzimotta on 11-09-02.
//  Copyright 2011 Daniel Drzimotta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RootViewController.h"

@interface nu_replAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, assign) IBOutlet RootViewController *rootViewController;

@end
