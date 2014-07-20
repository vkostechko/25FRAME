//
//  VKDeviceHardwareHelper.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/20/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKDeviceHardwareHelper : NSObject

+ (VKDeviceHardwareHelper*)instance;

- (BOOL)isInternetConnected;
- (int)internetConnectionType; // {NotReachable, ReachableViaWiFi, ReachableViaWWAN(3G)}

@end
