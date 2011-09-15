//
//  RootViewController.m
//  nu-repl
//
//  Created by Daniel Drzimotta on 11-09-02.
//  Copyright 2011 Soma Creates. All rights reserved.
//

#import "RootViewController.h"

#import "NuREPLController.h"

@implementation RootViewController
@synthesize ipAddressLabel;
@synthesize testOutputLabel;


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateButtonTouched:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [self setIpAddressLabel:nil];
    [self setTestOutputLabel:nil];
    [super viewDidUnload];
    
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [ipAddressLabel release];
    [testOutputLabel release];
    [super dealloc];
}

- (IBAction)updateButtonTouched:(id)sender {
    NSString *stringToUse = 
    [NSString stringWithFormat:@"%@",
     replEval(@"(test-output)")];
    
    self.testOutputLabel.text = stringToUse;
}
@end
