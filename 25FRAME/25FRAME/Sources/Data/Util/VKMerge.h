//
//  VKMerge.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/6/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKMerge : NSObject

typedef NSComparisonResult(^VKCompareBlock)(id entity, id data);
typedef id(^VKCreateEntityBlock)(id data);
typedef void(^VKUpdateEntityBlock)(id entity, id data);
typedef void(^VKDeleteEntityBlock)(id entity);

+ (void)mergeEntities:(NSArray *)entities
			fromArray:(NSArray*)dataArray
		  withCompare:(VKCompareBlock)compareBlock
		   withCreate:(VKCreateEntityBlock)createBlock
		   withUpdate:(VKUpdateEntityBlock)updateBlock
		   withDelete:(VKDeleteEntityBlock)deleteBlock;

+ (void)mergeSortedEntities:(NSArray*)entities
                  fromArray:(NSArray*)dataArray
                withCompare:(VKCompareBlock)compareBlock
                 withCreate:(VKCreateEntityBlock)createBlock
                 withUpdate:(VKUpdateEntityBlock)updateBlock
                 withDelete:(VKDeleteEntityBlock)deleteBlock;

@end

