//
//  VKMovieParticipant.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/20/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Movie;

@interface VKMovieParticipant : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) Movie *movie;

@end
