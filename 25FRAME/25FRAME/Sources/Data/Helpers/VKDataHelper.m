//
//  VKDataHelper.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 6/22/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKDataHelper.h"

@interface VKDataHelper ()

@end

@implementation VKDataHelper

#pragma mark - Public

SINGLETON(VKDataHelper)


- (NSDictionary *)dictionaryFromJsonData:(NSData*)data {
    if (!data) {
        return nil;
    }
    
    NSError* error;
    NSDictionary* jsonDict = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:kNilOptions
                              error:&error];
    if (!jsonDict){
        NSLog(@"NSJSONSerialization error %@", error.description);
        jsonDict = [NSDictionary dictionary];
    }
    
    return jsonDict;
}

#pragma mark - Private



@end
