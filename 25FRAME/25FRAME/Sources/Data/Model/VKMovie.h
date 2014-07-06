//
//  VKMovie.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/6/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface VKMovie : NSManagedObject

@property (nonatomic, retain) NSNumber * movieID;
@property (nonatomic, retain) NSString * year;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * bestTorrentQuality;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSString * originalname;

@end
