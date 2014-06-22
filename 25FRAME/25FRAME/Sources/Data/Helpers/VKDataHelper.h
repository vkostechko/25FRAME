//
//  VKDataHelper.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 6/22/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKDataHelper : NSObject

+ (VKDataHelper*)instance;

- (NSDictionary *)dictionaryFromJsonData:(NSData*)data;

@end
