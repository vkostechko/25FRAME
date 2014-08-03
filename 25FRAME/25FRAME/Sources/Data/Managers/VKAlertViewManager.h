//
//  VKAlertViewManager.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 8/3/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIAlertView+MKBlockAdditions.h"

@interface VKAlertViewManager : NSObject

+ (VKAlertViewManager*)instance;

- (void)showOfflineModeErrorAlertView;
- (void)showLoadingMoviesErrorAlertView;

@end
