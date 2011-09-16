//
//  NuREPLController.m
//  nu-repl
//
//  Created by Daniel Drzimotta on 11-09-14.
//  Copyright 2011 Daniel Drzimotta. All rights reserved.
//

#import "NuREPLController.h"

#import "RemoteMessageInterface.h"
#import "Nu.h"

@interface NuREPLController : NSObject <RemoteMessageInterfaceDelegate>
@property (nonatomic, readwrite, retain) RemoteMessageInterface *rmi;
@end

static NuREPLController* _sharedNuREPLController = nil;

@implementation NuREPLController
@synthesize rmi;

+(NuREPLController*)sharedNuREPLController
{
	@synchronized([NuREPLController class])
	{
		if (!_sharedNuREPLController)
			[[self alloc] init];
        
		return _sharedNuREPLController;
	}
    
	return nil;
}

+(id)alloc
{
	@synchronized([NuREPLController class])
	{
		NSAssert(_sharedNuREPLController == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedNuREPLController = [super alloc];
		return _sharedNuREPLController;
	}
    
	return nil;
}

-(id)init {
	self = [super init];
	if (self != nil) {        
        self.rmi = [[[RemoteMessageInterface alloc] initWithWelcomeMessage:@""
                                                                 andPrompt:@""]
                    autorelease];
        self.rmi.delegate = self;
        
        [self.rmi startOnSocket:40005];
	}
    
	return self;
}

-(id) readAndEvaluate:(NSString*)message {
    id parser = [Nu sharedParser];
    
    id code = nil;
    id result = nil;
    
    @try {
        code = [parser parse:message];
    }
    @catch (NSException *exception) {
        [parser reset];
        return [NSString stringWithFormat:@"Exception: %@", exception];
    }
    
    @try {
        result = [parser eval:code];
    }
    @catch (NSException *exception) {
        [parser reset];
        return [NSString stringWithFormat:@"Exception: %@", exception];
    }
    
    if ([parser incomplete]) {
        result = @"Incomplete form. Resetting.";
        [parser reset];
    }
    
    return [NSString stringWithFormat:@"%@", result];
}

-(NSString*) remoteMessageInterface:(RemoteMessageInterface*)interface
                    receivedMessage:(NSString*)message {
    return [self readAndEvaluate:message];
}

-(NSString*) ipAddress {
    return [self.rmi getIPAddress];
}
-(NSString*) port {
    return [self.rmi port];
}

-(void) applicationDidLaunchFromNotification:(NSNotification*)notification {

}
@end

NSString* replIPAddress(void) {
    return [[NuREPLController sharedNuREPLController] ipAddress];
}

NSString* replPort(void) {
    return [[NuREPLController sharedNuREPLController] port];
}

id replEval(NSString *message) {
    return [[NuREPLController sharedNuREPLController] readAndEvaluate:message];
}

id replEvalFile(NSString *fileInMainBundleName) {
    id path = [[NSBundle mainBundle] pathForResource:fileInMainBundleName 
                                                ofType:nil];
    NSString *fileContents = [NSString stringWithContentsOfFile:path 
                                                       encoding:NSUTF8StringEncoding 
                                                          error:NULL];
    return replEval(fileContents);
}

void replSetup(void) {
    [NuREPLController sharedNuREPLController];
}
