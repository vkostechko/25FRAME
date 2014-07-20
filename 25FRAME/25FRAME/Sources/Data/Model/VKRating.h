//
//  VKRating.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/20/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Movie;

@interface VKRating : NSManagedObject

@property (nonatomic, retain) NSNumber * kinopoiskVotes;
@property (nonatomic, retain) NSNumber * kinopoiskId;
@property (nonatomic, retain) NSNumber * kinopoiskRate;
@property (nonatomic, retain) NSString * imdbId;
@property (nonatomic, retain) NSNumber * imdbRate;
@property (nonatomic, retain) NSNumber * imdbVotes;
@property (nonatomic, retain) NSString * tvcomId;
@property (nonatomic, retain) NSNumber * tvcomRate;
@property (nonatomic, retain) NSNumber * tvcomVotes;
@property (nonatomic, retain) Movie *movie;

@end
