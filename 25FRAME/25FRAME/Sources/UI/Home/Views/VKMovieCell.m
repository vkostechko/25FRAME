//
//  VKMovieCell.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/6/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKMovieCell.h"
#import "SDWebImageManager.h"

@interface VKMovieCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgvAvatar;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblGenre;

@end

@implementation VKMovieCell

#pragma mark - Life cycle

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Override setters

- (void)setMovie:(VKMovie *)movie {
    if (_movie != movie) {
        _movie = movie;
        
        self.lblTitle.text = _movie.name;
        self.lblGenre.text = _movie.originalName;
        NSURL* posterURL = [_movie posterURLWithWidth:(MoviePosterWidth60)];
        [[SDWebImageManager sharedManager]downloadWithURL:posterURL
                                                  options:SDWebImageProgressiveDownload
                                                 progress:^(NSInteger receivedSize, NSInteger expectedSize) {}
                                                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished) {
                                                    self.imgvAvatar.image = image;
                                                    [self setNeedsLayout];
        }];
        
    }
}

@end
