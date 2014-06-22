//
//  VKRemoteFacade.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 6/22/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "VKModelConstants.h"

/**
 *  The VKRemoteFacade class provides interface to work with server.
 */
@interface VKRemoteFacade : NSObject {
    AFHTTPRequestOperationManager *manager;
}

/**
 *  Creates if it's necessary and returns a VKRemoteFacade object.
 *
 *  @return An initialized VKRemoteFacade object, or nil if there was a problem creating the object.
 */
+ (VKRemoteFacade*)instance;

/**
 *  Loads movies.
 *
 *  @param completion The CallbackWithDataAndError object used to handle request finishing.
 */
- (void)loadMoviesWithCompletion:(CallbackWithDataAndError)completion;

@end
