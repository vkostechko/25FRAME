//
//  VKDeviceHardwareHelper.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/20/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKDeviceHardwareHelper.h"
#import "Reachability.h"

@implementation VKDeviceHardwareHelper

SINGLETON(VKDeviceHardwareHelper)

#pragma mark - internet connection

- (BOOL)isInternetConnected
{
	Reachability *reachability = [Reachability reachabilityForInternetConnection];
	NetworkStatus networkStatus = [reachability currentReachabilityStatus];
	return !(networkStatus == NotReachable);
    //return [AFNetworkReachabilityManager sharedManager].isReachable;
}

- (int)internetConnectionType
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reachability currentReachabilityStatus];
    return status;
}


@end
