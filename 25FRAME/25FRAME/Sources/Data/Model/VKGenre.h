//
//  VKGenre.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/20/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class VKMovie;

@interface VKGenre : NSManagedObject

@property (nonatomic, retain) NSNumber * genreId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *movies;
@end

@interface VKGenre (CoreDataGeneratedAccessors)

- (void)addMoviesObject:(VKMovie *)value;
- (void)removeMoviesObject:(VKMovie *)value;
- (void)addMovies:(NSSet *)values;
- (void)removeMovies:(NSSet *)values;

@end
