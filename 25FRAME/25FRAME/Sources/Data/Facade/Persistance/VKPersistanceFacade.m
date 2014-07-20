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
#import "VKRating.h"
#import "VKMovieParticipant.h"
#import "VKModelConstants.h"


static NSString * const kKeyID = @"id";
static NSString * const kKeyName = @"name";
static NSString * const kKeyOriginalName = @"original_name";
static NSString * const kKeyDuration = @"duration";
static NSString * const kKeyType = @"type";
static NSString * const kKeyYear = @"year";
static NSString * const kKeyBestTorrentQuality = @"best_torrent_quality";

static NSString * const kKeyRatings = @"ratings";
static NSString * const kKeyKinopoisk = @"kinopoisk.ru";
static NSString * const kKeyIMBD = @"imdb.com";
static NSString * const kKeyTVCOM = @"tv.com";

static NSString * const kKeyVotes = @"votes";
static NSString * const kKeyRate = @"rate";

static NSString * const kKeyActor = @"actor";
static NSString * const kKeyComposer = @"composer";
static NSString * const kKeyDirector = @"director";
static NSString * const kKeyOperator = @"operator";
static NSString * const kKeyProducer = @"producer";
static NSString * const kKeyWriter = @"writer";

static NSString* const kKeyGenreId = @"genreId";
static NSString* const kKeyMovieId = @"movieId";

@interface VKPersistanceFacade ()

- (void)createAndAddParticipantsToMovie:(VKMovie*)movie withData:(NSArray*)data type:(MovieParticipantType)type inContext:(NSManagedObjectContext*)context;
- (void)createAndAddGenresToMovie:(VKMovie*)movie withData:(NSArray*)data inContext:(NSManagedObjectContext*)context;

- (VKGenre*)genreById:(NSNumber*)genreId inContext:(NSManagedObjectContext*)context;

@end

@implementation VKPersistanceFacade

SINGLETON(VKPersistanceFacade)

#pragma mark - Movies

- (void)saveMoviesWithData:(NSArray *)data andCompletionBlock:(VKPersistenceCompletionHandler)completion {
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        NSArray *localMovies = [VKMovie MR_findAllInContext:localContext];
    
        [VKMerge mergeEntities:localMovies fromArray:data withCompare:^NSComparisonResult(VKMovie* movie, id data) {
            NSComparisonResult result = [movie.movieID compare:data[kKeyID]];
            return result;
        } withCreate:^id(id data) {
            VKMovie *movie = [VKMovie MR_createInContext:localContext];
            movie.movieID = data[kKeyID];
            return movie;
        } withUpdate:^(VKMovie* movie, id data) {
            //TODO: update movie params
            movie.name = data[kKeyName];
            movie.originalName = NULL_TO_NIL(data[kKeyOriginalName]);
            movie.duration = data[kKeyDuration];
            movie.bestTorrentQuality = data[kKeyBestTorrentQuality];
            movie.type = data[kKeyType];
            
            NSArray* genres = data[kKeyGenres];
            if (genres) {
                [movie removeGenres:movie.genres];
                [self createAndAddGenresToMovie:movie withData:genres inContext:localContext];
            }
            
            NSDictionary* ratings = data[kKeyRatings];
            if (ratings) {
                VKRating* rating = [VKRating MR_createInContext:localContext];
                
                rating.kinopoiskId = NULL_TO_NIL(ratings[kKeyKinopoisk][kKeyID]);
                rating.imdbId = NULL_TO_NIL(ratings[kKeyIMBD][kKeyID]);
                rating.tvcomId = NULL_TO_NIL(ratings[kKeyTVCOM][kKeyID]);
                
                rating.kinopoiskVotes = NULL_TO_NIL(ratings[kKeyKinopoisk][kKeyVotes]);
                rating.imdbVotes = NULL_TO_NIL(ratings[kKeyIMBD][kKeyVotes]);
                rating.tvcomVotes = NULL_TO_NIL(ratings[kKeyTVCOM][kKeyVotes]);

                
                rating.kinopoiskRate = NULL_TO_NIL(ratings[kKeyKinopoisk][kKeyRate]);
                rating.imdbRate = NULL_TO_NIL(ratings[kKeyIMBD][kKeyRate]);
                rating.tvcomRate = NULL_TO_NIL(ratings[kKeyTVCOM][kKeyRate]);

                movie.ratings = rating;
            }
            
            NSDictionary* participants = data[kKeyParticipants];
            if (participants) {
                
                NSSet* movieParticipants = movie.participants;
                [movie removeParticipants:movieParticipants];

                //add actors
                [self createAndAddParticipantsToMovie:movie withData:participants[kKeyActor] type:MovieParticipantTypeActor inContext:localContext];
                //add operators
                [self createAndAddParticipantsToMovie:movie withData:participants[kKeyOperator] type:MovieParticipantTypeOperator inContext:localContext];
                // add producers
                [self createAndAddParticipantsToMovie:movie withData:participants[kKeyProducer] type:MovieParticipantTypeProducer inContext:localContext];
                // add composers
                [self createAndAddParticipantsToMovie:movie withData:participants[kKeyComposer] type:MovieParticipantTypeComposer inContext:localContext];
                // add directors
                [self createAndAddParticipantsToMovie:movie withData:participants[kKeyDirector] type:MovieParticipantTypeDirector inContext:localContext];
                // add writers
                [self createAndAddParticipantsToMovie:movie withData:participants[kKeyWriter] type:MovieParticipantTypeWriter inContext:localContext];
                
            }
            
            
        } withDelete:^(id entity) {
            //do nothing
        }];
    }completion:completion];
    
}

- (NSArray*)allMovies {
    return [VKMovie MR_findAllSortedBy:kKeyMovieId ascending:NO];
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


#pragma mark - Private

- (void)createAndAddParticipantsToMovie:(VKMovie*)movie withData:(NSArray*)data type:(MovieParticipantType)type inContext:(NSManagedObjectContext*)context {
    for (NSDictionary* participantData in data) {
        VKMovieParticipant* participant = [VKMovieParticipant MR_createInContext:context];
        participant.id = participantData[kKeyID];
        participant.name = participantData[kKeyName];
        participant.type = @(type);
        
        [movie addParticipantsObject:participant];
    }
}

- (void)createAndAddGenresToMovie:(VKMovie*)movie withData:(NSArray*)data inContext:(NSManagedObjectContext*)context {
    
    for (NSDictionary* genreData in data) {
        VKGenre* genre = [self genreById:genreData[kKeyID] inContext:context];
        if (!genre) {
           genre = [VKGenre MR_createInContext:context];
        }
        genre.genreId = genreData[kKeyID];
        genre.name = genreData[kKeyName];
        
        [movie addGenresObject:genre];
    }
    
}

- (VKGenre*)genreById:(NSNumber*)genreId inContext:(NSManagedObjectContext*)context {
    VKGenre* genre = [VKGenre MR_findFirstByAttribute:kKeyGenreId withValue:genreId inContext:context];
    return genre;
}

@end
