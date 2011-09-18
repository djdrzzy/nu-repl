//
//  NuREPLController.h
//  nu-repl
//
//  Created by Daniel Drzimotta on 11-09-14.
//  Copyright 2011 Daniel Drzimotta. All rights reserved.
//

#import <Foundation/Foundation.h>

// Allows you to get network information
NSString* replIPAddress(void);
NSString* replPort(void);

// Allows you to evaluate a Nu string in Objective-C code.
id replEval(NSString *message);

// Evaluates a whole file.
id replEvalFile(NSString *fileInMainBundleName);

// Sets up the shared Nu context. This is called internally if any of the above methods are called but you can explicitly call it as well.
void replSetup(void);
