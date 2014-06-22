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

static NSString * const kBaseURL = @"http://media.kinobaza.tv";
static NSString * const kMoviePosterURL = @"/films/<film_id>/poster/<width>.jpg";
static NSString * const kActorPhotoURL = @"/persons/<person_id>/photo/60.jpg";
static NSString * const kUserAvatarURL = @"/users/<user_id>/avatar/<width>.png";

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


#pragma mark - Persistance

