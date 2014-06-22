//
//  VKModelConstants.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 6/22/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - General

#pragma mark - Remote 

typedef void(^CallbackWithDataAndError)(id data, NSError *error);

static NSString * const kBaseURL = @"http://api.kinobaza.tv";
static NSString * const kMoviePosterURL = @"/films/<film_id>/poster/<width>.jpg";
static NSString * const kActorPhotoURL = @"/persons/<person_id>/photo/60.jpg";
static NSString * const kUserAvatarURL = @"/users/<user_id>/avatar/<width>.png";

static NSString * const kBrowseMoviesURL = @"/films/browse";
static NSString * const kMoviesByIDURL = @"/films/";
static NSString * const kSearchMoviesURL = @"/films/search";
static NSString * const kSearchMoviesByFileURL = @"/films/search-by-file";
static NSString * const kMoviesLookUpURL = @"/films/lookup";

static NSString * const kGenresURL = @"/genres";
static NSString * const kCountriesURL = @"/countries";
static NSString * const kLanguagesURL = @"/languages";
static NSString * const kTrackersURL = @"/trackers";

static NSString * const kKeyIDs = @"ids";
static NSString * const kKeytype = @"type";
static NSString * const kKeyMoviesQueryMask = @"fields_mask";
static NSString * const kKeyGenres = @"genres";
static NSString * const kKeyGenresNOT = @"genres_not";
static NSString * const kKeyGenresMode = @"genres_mode";
static NSString * const kKeyLangs = @"languages";
static NSString * const kKeyParticipants = @"participants";
static NSString * const kKeyCountries = @"countries";
static NSString * const kKeyCountries_not = @"countries_not";
static NSString * const kKeyMaxImdbRating = @"imdb_rating_max";
static NSString * const kKeyMinImdbRating = @"imdb_rating_min";
static NSString * const kKeyMaxKinopoiskRating = @"kinopoisk_rating_max";
static NSString * const kKeyMinKinopoiskRating = @"kinopoisk_rating_min";
static NSString * const kKeyMinImdbRatingVoted = @"imdb_rating_voted_min";
static NSString * const kKeyMinKinopoiskRatingVoted = @"kinopoisk_rating_voted_min";
static NSString * const kKeyMaxYear = @"year_max";
static NSString * const kKeyMinYear = @"year_min";
static NSString * const kKeyDubbingTypes = @"dubbing_types";
static NSString * const kKeyQualities = @"qualities";
static NSString * const kKeySort = @"sort";
static NSString * const kKeyLimit = @"limit";
static NSString * const kKeyOffset = @"offset";
static NSString * const kKeyMarkedToBeHide = @"hide_marked";
static NSString * const kKeyQuery = @"query";
static NSString * const kKeyFilePath = @"filepath";
static NSString * const kKeyHash = @"hash";
static NSString * const kKeyNames = @"names";
static NSString * const kKeyYears = @"years";
static NSString * const kKeyNamesOfParticipants = @"participant_names";
static NSString * const kKeyDurationInSeconds = @"duration_seconds";
static NSString * const kKeyCountryIDs = @"country_ids";
static NSString * const kKeyGenreIDs = @"genre_ids";
static NSString * const kKeyLinks = @"links";

typedef enum {
    ServerRespponseCodeUndefined = -1,
    ServerRespponseCodeOK = 200,
    ServerRespponseCodeNeedsAuthorization = 401,
    ServerRespponseCodeAccessDenied = 403,
    ServerRespponseCodeFileNotFound = 404,
    ServerRespponseCodeWrongRequest = 405,
    ServerRespponseCodEexceededRequeststheNumber = 503
}ServerRespponseCode;

//(width = 207, 60, 40)
typedef enum {
    MoviePosterWidthUndefined = -1,
    MoviePosterWidth40 = 40,
    MoviePosterWidth60 = 60,
    MoviePosterWidth207 = 207
}MoviePosterWidth;

typedef enum {
    ActorPhotoWidthUndefined = -1,
    ActorPhotoWidth60 = 60
}ActorPhotoWidth;

//(width = 150, 30)
typedef enum {
    UserAvatarWidthUndefined = -1,
    UserAvatarWidth30 = 30,
    UserAvatarWidth150 = 150
}UserAvatarWidth;

typedef enum {
 MovieQueryMaskOnlyIDs = 0,
    MovieQueryMaskBaseInfo = 1,
    MovieQueryMaskDescription = 2,
    MovieQueryMaskActors = 4,
    MovieQueryMaskGenres = 8,
    MovieQueryMaskCommercialInfo = 16,
    MovieQueryMaskRatings = 32
}MovieQueryMask;

#pragma mark - Persistance

