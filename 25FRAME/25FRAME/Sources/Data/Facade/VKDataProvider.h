//
//  VKDataProvider.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/20/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DataProviderCompletionHandler)(NSArray *results, NSError *error);

@interface VKDataProvider : NSObject

+ (VKDataProvider*)instance;

- (void)loadMoviesWithCompletion:(DataProviderCompletionHandler)completion;
- (void)loadTVSeriesWithCompletion:(DataProviderCompletionHandler)completion;

- (void)loadGenresWithCompletion:(DataProviderCompletionHandler)completion;

@end
