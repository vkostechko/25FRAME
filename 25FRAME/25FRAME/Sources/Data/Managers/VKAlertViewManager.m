//
//  VKAlertViewManager.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 8/3/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKAlertViewManager.h"

@implementation VKAlertViewManager

#pragma mark - Public 

SINGLETON(VKAlertViewManager)

- (void)showOfflineModeErrorAlertView {
    [self showAlertWithTitle:NSLocalizedString(@"ALERT_TITLE_OFFLINE", nil)
                  andMessage:NSLocalizedString(@"ALERT_MSG_OFFLINE", nil)];
}

- (void)showLoadingMoviesErrorAlertView {
    [self showAlertWithTitle:NSLocalizedString(@"ALERT_TITLE_ERROR", nil)
                  andMessage:NSLocalizedString(@"ALERT_MSG_SERVER_ERROR", nil)];
}

#pragma mark - Private

- (void)showAlertWithTitle:(NSString*)title andMessage:(NSString*)message
{
    [UIAlertView alertViewWithTitle:title
                            message:message
                  cancelButtonTitle:NSLocalizedString(@"OK", nil)];
    
}


@end
