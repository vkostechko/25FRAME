//
//  VKMovie.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/20/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class VKGenre, VKMovieParticipant, VKRating;

@interface VKMovie : NSManagedObject

@property (nonatomic, retain) NSString * movieDescription;
@property (nonatomic, retain) NSString * bestTorrentQuality;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSNumber * movieID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * originalName;
@property (nonatomic, retain) NSString * year;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) VKRating *ratings;
@property (nonatomic, retain) NSSet *participants;
@property (nonatomic, retain) NSSet *genres;

- (NSURL*)posterURLWithWidth:(MoviePosterWidth)width;

@end

@interface VKMovie (CoreDataGeneratedAccessors)

- (void)addParticipantsObject:(VKMovieParticipant *)value;
- (void)removeParticipantsObject:(VKMovieParticipant *)value;
- (void)addParticipants:(NSSet *)values;
- (void)removeParticipants:(NSSet *)values;

- (void)addGenresObject:(VKGenre *)value;
- (void)removeGenresObject:(VKGenre *)value;
- (void)addGenres:(NSSet *)values;
- (void)removeGenres:(NSSet *)values;

@end
