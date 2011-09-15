//
//  NuREPLController.h
//  nu-repl
//
//  Created by Daniel Drzimotta on 11-09-14.
//  Copyright 2011 Soma Creates. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString* replIPAddress(void);
NSString* replPort(void);
id replEval(NSString *message);

@interface NuREPLController : NSObject
@end
