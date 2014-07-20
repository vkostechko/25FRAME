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
#import "VKGenre.h"

static NSString * const kKeyID = @"id";
static NSString * const kKeyName = @"name";

@implementation VKPersistanceFacade

SINGLETON(VKPersistanceFacade)

#pragma mark - Movies

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


#pragma mark - Genres

- (void)saveGenresWithData:(NSArray*)data andCompletionBlock:(VKPersistenceCompletionHandler)completion {
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        NSArray* localGenres = [VKGenre MR_findAllInContext:localContext];
        
        [VKMerge mergeEntities:localGenres fromArray:data withCompare:^NSComparisonResult(VKGenre* genre, id data) {
            return [genre.genreId compare:data[kKeyID]];
        } withCreate:^id(id data) {
            VKGenre* genre = [VKGenre MR_createInContext:localContext];
            genre.genreId = data[kKeyID];
            return genre;
        } withUpdate:^(VKGenre* genre, id data) {
            genre.name = data[kKeyName];
        } withDelete:^(id entity) {
            //do nothing
        }];
        
    }completion:completion];
}

- (NSArray*)allGenres {
    NSArray* allGenres = [VKGenre MR_findAllSortedBy:kKeyName ascending:YES];
    return allGenres;
}


@end
