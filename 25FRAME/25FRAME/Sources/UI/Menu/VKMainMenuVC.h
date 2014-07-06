//
//  VKMainMenuVC.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/5/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "APLSlideMenuViewController.h"

@protocol VKMenuDelegate <NSObject>

@required
- (void)menuDidSelectItem:(MenuItem)menuItem;

@end



@interface VKMainMenuVC : APLSlideMenuViewController

@property (nonatomic, assign) id<VKMenuDelegate> menuDelegate;

@end
