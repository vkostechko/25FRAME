//
//  VKGenre.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/20/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface VKGenre : NSManagedObject

@property (nonatomic, retain) NSNumber * genreId;
@property (nonatomic, retain) NSString * name;

@end
