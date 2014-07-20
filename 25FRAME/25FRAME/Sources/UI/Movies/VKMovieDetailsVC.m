//
//  VKMovieDetailsVC.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/20/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKMovieDetailsVC.h"
#import "SDWebImageManager.h"

@interface VKMovieDetailsVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imgvCover;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDirector;
@property (weak, nonatomic) IBOutlet UILabel *lblActors;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

- (void)updateMovieInfo;

@end

@implementation VKMovieDetailsVC

#pragma mark - Lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateMovieInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Override setters

- (void)setMovie:(VKMovie *)movie {
    
    if (_movie != movie) {
        _movie = movie;
        
        [self updateMovieInfo];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Private

- (void)updateMovieInfo {
    
    self.lblTitle.text = self.movie.name;
    self.lblDescription.text = self.movie.movieDescription;
    NSURL* posterURL = [self.movie posterURLWithWidth:(MoviePosterWidth207)];
    [[SDWebImageManager sharedManager]downloadWithURL:posterURL
                                              options:SDWebImageProgressiveDownload
                                             progress:^(NSInteger receivedSize, NSInteger expectedSize) {}
                                            completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished) {
                                                self.imgvCover.image = image;
                                            }];

    
}


@end
