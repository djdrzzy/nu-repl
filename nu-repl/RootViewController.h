//
//  RootViewController.h
//  nu-repl
//
//  Created by Daniel Drzimotta on 11-09-02.
//  Copyright 2011 Soma Creates. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController {
    UILabel *ipAddressLabel;
    UILabel *testOutputLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *ipAddressLabel;
@property (nonatomic, retain) IBOutlet UILabel *testOutputLabel;

- (IBAction)updateButtonTouched:(id)sender;
@end
