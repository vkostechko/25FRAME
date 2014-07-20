//
//  VKMovie.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/20/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKMovie.h"
#import "VKGenre.h"
#import "VKMovieParticipant.h"
#import "VKRating.h"
#import "VKModelConstants.h"


@implementation VKMovie

@dynamic movieDescription;
@dynamic bestTorrentQuality;
@dynamic duration;
@dynamic movieID;
@dynamic name;
@dynamic originalName;
@dynamic year;
@dynamic type;
@dynamic ratings;
@dynamic participants;
@dynamic genres;

- (NSURL*)posterURLWithWidth:(MoviePosterWidth)width {
    NSString* urlString = [kMediaBaseURL stringByAppendingPathComponent:MOVIE_POSTER_URL(self.movieID, width)];
    NSURL* url = [NSURL URLWithString:urlString];
    return url;
}

@end
