//
//  VKPersistanceFacade.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 6/22/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>

typedef MRSaveCompletionHandler VKPersistenceCompletionHandler;
typedef void (^FetchCompletionHandler)(NSArray *results, NSError *error);
typedef void (^FetchActionsCompletionHandler)(NSArray *userActions, NSArray *otherActions, NSError *error);

@interface VKPersistanceFacade : NSObject

+ (VKPersistanceFacade*)instance;


- (void)saveMoviesWithData:(NSArray*)data andCompletionBlock:(VKPersistenceCompletionHandler)completion;
- (NSArray*)allMovies;

- (void)saveGenresWithData:(NSArray*)data andCompletionBlock:(VKPersistenceCompletionHandler)completion;
- (NSArray*)allGenres;

@end
