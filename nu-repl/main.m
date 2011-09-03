//
//  main.m
//  nu-repl
//
//  Created by Daniel Drzimotta on 11-09-02.
//  Copyright 2011 Soma Creates. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  int retVal = UIApplicationMain(argc, argv, nil, nil);
  [pool release];
  return retVal;
}
