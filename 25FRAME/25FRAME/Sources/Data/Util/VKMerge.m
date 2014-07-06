//
//  VKMerge.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/6/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKMerge.h"
#import <CoreData/CoreData.h>

@implementation VKMerge

+ (void)mergeEntities:(NSArray *)entities
			fromArray:(NSArray *)dataArray
		  withCompare:(VKCompareBlock)compareBlock
		   withCreate:(VKCreateEntityBlock)createBlock
		   withUpdate:(VKUpdateEntityBlock)updateBlock
		   withDelete:(VKDeleteEntityBlock)deleteBlock
{
	if (!entities) entities = [NSArray array];
	if (!dataArray) dataArray = [NSArray array];
	
	NSMutableSet *toRemove = [NSMutableSet setWithArray:entities];
	for (id dataObj in dataArray){
		id oldEntity = nil;
		for (NSManagedObject *entity in entities){
			if (compareBlock(entity, dataObj) == NSOrderedSame){
				oldEntity = entity;
				break;
			}
		}
		
		if (oldEntity){
			// found existing
			[toRemove removeObject:oldEntity];
			updateBlock(oldEntity, dataObj);
		} else {
			// new item
			id entity = createBlock(dataObj);
			updateBlock(entity, dataObj);
		}
	}
	
	for (id entity in toRemove){
		deleteBlock(entity);
	}
}

+ (void)mergeSortedEntities:(NSArray *)entities
                  fromArray:(NSArray *)dataArray
                withCompare:(VKCompareBlock)compareBlock
                 withCreate:(VKCreateEntityBlock)createBlock
                 withUpdate:(VKUpdateEntityBlock)updateBlock
                 withDelete:(VKDeleteEntityBlock)deleteBlock
{
    //TODO: implement merge for two sorted collections
    [self mergeEntities:entities fromArray:dataArray withCompare:compareBlock withCreate:createBlock withUpdate:updateBlock withDelete:deleteBlock];
}
@end
