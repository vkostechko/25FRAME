//
//  main.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 6/21/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VKAppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        int retVal = -1;
        
#if DEBUG
        @try {
#endif
            
            retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([VKAppDelegate class]));
            
#if DEBUG
        }
        @catch (NSException* exception) {
            NSLog(@"Uncaught exception: %@", exception.description);
            NSLog(@"Stack trace: %@", [exception callStackSymbols]);
        }
#endif
        return retVal;
    }

}
