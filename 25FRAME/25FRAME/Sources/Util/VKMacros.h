//
//  VKMacros.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 6/22/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>


#define SINGLETON(className) \
static className *_##classNameInstance; \
+ (className *)instance { return _##classNameInstance; } \
+ (void)initialize { if (!_##classNameInstance) {_##classNameInstance = [[className alloc] init];} }


#define IS_IPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_568 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568)

#define IS_IPAD ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0)


#define COLOR_NAVBAR [UIColor colorWithRed:44./255 green:212./255 blue:200./255 alpha:1.]
#define COLOR_MENU_TBLV_BACKGROUND [UIColor colorWithRed:36./255 green:35./255 blue:54./255 alpha:1.]
#define COLOR_MENU_CELL_BACKGROUND [UIColor colorWithRed:54./255 green:53./255 blue:82./255 alpha:1.]
#define COLOR_MENU_CELL_SELECTED_BACKGROUND [UIColor colorWithRed:32./255 green:53./255 blue:82./255 alpha:1.]


#define NULL_TO_NIL(obj) ({ __typeof__ (obj) __obj = (obj); __obj == [NSNull null] ? nil : obj; })