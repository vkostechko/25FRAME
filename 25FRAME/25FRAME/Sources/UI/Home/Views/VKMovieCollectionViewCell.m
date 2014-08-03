//
//  VKMovieCollectionViewCell.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/6/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKMovieCollectionViewCell.h"
#import "SDWebImageManager.h"

@interface VKMovieCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgvPoster;
@property (weak, nonatomic) IBOutlet UILabel *lblMovieName;

- (void)refreshUI;

@end

@implementation VKMovieCollectionViewCell

#pragma mark - Override setters

- (void)setMovie:(VKMovie *)movie {
    if (_movie != movie) {
        _movie = movie;
        [self refreshUI];
    }
}

#pragma mark - Private

- (void)refreshUI {

    self.lblMovieName.text = self.movie.name;
    NSURL* posterURL = [self.movie posterURLWithWidth:(MoviePosterWidth207)];
    [[SDWebImageManager sharedManager]downloadWithURL:posterURL
                                              options:SDWebImageProgressiveDownload
                                             progress:^(NSInteger receivedSize, NSInteger expectedSize) {}
                                            completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished) {
                                                self.imgvPoster.image = image;
                                                [self setNeedsLayout];
                                            }];

    
}

@end
