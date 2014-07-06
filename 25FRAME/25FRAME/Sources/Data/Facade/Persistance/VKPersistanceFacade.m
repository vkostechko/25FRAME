//
//  VKPersistanceFacade.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 6/22/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKPersistanceFacade.h"
#import "VKMerge.h"
#import "VKMovie.h"

static NSString * const kKeyID = @"id";

@implementation VKPersistanceFacade

SINGLETON(VKPersistanceFacade)

- (void)saveMoviesWithData:(NSArray *)data andCompletionBlock:(VKPersistenceCompletionHandler)completion {
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        NSArray *localMovies = [VKMovie MR_findAllInContext:localContext];
        
        for (VKMovie* m in localMovies) {
            NSLog(@"%@", m.movieID);
        }
        
        [VKMerge mergeEntities:localMovies fromArray:data withCompare:^NSComparisonResult(VKMovie* movie, id data) {
            NSComparisonResult result = [movie.movieID compare:data[kKeyID]];
            return result;
        } withCreate:^id(id data) {
            VKMovie *movie = [VKMovie MR_createInContext:localContext];
            NSLog(@"%@",data[kKeyID]);
            movie.movieID = data[kKeyID];
            return movie;
        } withUpdate:^(VKMovie* movie, id data) {
            //TODO: update movie params
        } withDelete:^(id entity) {
            //do nothing
        }];
    }completion:completion];
    
}

- (NSArray*)allMovies {
    return [VKMovie MR_findAllSortedBy:@"movieID" ascending:NO];
}

@end
