//
//  VKHomeVC.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/6/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKHomeVC.h"
#import "VKMovieCell.h"
#import "VKMovieCollectionViewCell.h"
#import "VKMainMenuVC.h"
#import "VKMovieDetailsVC.h"

#define CELL_ID_TOP_CELL @"CELL_ID_TOP_CELL"
#define CELL_ID_MOVIE @"CELL_ID_Movie"
#define CELL_ID_MOVIECOLLECTIONVIEW @"CELL_ID_MovieCollectionView"

#define ANIMATION_DURATION 0.5f

@interface VKHomeVC ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, VKMenuDelegate>

@property (nonatomic, strong) NSArray* movies;
@property (nonatomic, strong) NSArray* tvSeries;

@property (weak, nonatomic) IBOutlet UITableView *tbvMovies;
@property (weak, nonatomic) IBOutlet UICollectionView *clvTVSeries;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *clvTVSeriesTopSpacing;

@property (nonatomic, strong) VKMovie* selectedMovie;
- (IBAction)btnMenuDidTap:(id)sender;
- (IBAction)btnMoviesDidTap:(id)sender;

@end

@implementation VKHomeVC

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [((VKMainMenuVC*)self.slideMenuController) setMenuDelegate:self];

    [[VKDataProvider instance]loadTVSeriesWithCompletion:^(NSArray *tvSeries, NSError *error) {
        self.tvSeries = tvSeries;
        [[VKDataProvider instance]loadMoviesWithCompletion:^(NSArray *movies, NSError *error) {
            self.movies = movies;
        }];
    }];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Override setters

- (void)setMovies:(NSArray *)movies {
    if (_movies != movies) {
        _movies = movies;
        [self.tbvMovies reloadData];
    }
}

- (void)setTvSeries:(NSArray *)tvSeries {
    if (_tvSeries != tvSeries) {
        _tvSeries = tvSeries;
        [self.clvTVSeries reloadData];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:SEGUE_ID_MOVIE_DETAILS]) {
        [((VKMovieDetailsVC*)segue.destinationViewController) setMovie:self.selectedMovie];
    }
}

#pragma mark - IBActions
- (IBAction)btnMenuDidTap:(id)sender {
    [self.slideMenuController showMenu:YES];
}

- (IBAction)btnMoviesDidTap:(id)sender {
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VKMovieCell* cell = (VKMovieCell*)[tableView dequeueReusableCellWithIdentifier:CELL_ID_MOVIE forIndexPath:indexPath];
    [cell setMovie:self.movies[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0f;
    
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedMovie = self.movies[indexPath.row];
    return indexPath;
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tvSeries.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VKMovieCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID_MOVIECOLLECTIONVIEW forIndexPath:indexPath];
    cell.movie = self.tvSeries[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedMovie = self.tvSeries[indexPath.row];
    return YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tbvMovies) {
        CGPoint offset = scrollView.contentOffset;
        CGFloat newTopOffset = (offset.y >= 25.0) ? - CGRectGetHeight(self.clvTVSeries.frame) : 0.0f;
        [UIView animateWithDuration:ANIMATION_DURATION animations:^{
            self.clvTVSeriesTopSpacing.constant = newTopOffset;
            [self.view layoutIfNeeded];
        }];
    }
}

#pragma mark - VKMenuDelegate

- (void)menuDidSelectItem:(MenuItem)menuItem {
    
    NSLog(@"%i", menuItem);
}

#pragma mark - Private


@end
