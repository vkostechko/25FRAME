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

#define CELL_ID_TBVL(row) ((row == 0) ? CELL_ID_TOP_CELL : CELL_ID_MOVIE)
#define CELL_ID_TOP_CELL @"CELL_ID_TOP_CELL"
#define CELL_ID_MOVIE @"CELL_ID_Movie"
#define CELL_ID_MOVIECOLLECTIONVIEW @"CELL_ID_MovieCollectionView"

@interface VKHomeVC ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, VKMenuDelegate>

@property (nonatomic, strong) NSArray* movies;
@property (weak, nonatomic) IBOutlet UITableView *tbvMovies;

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

    [[VKDataProvider instance]loadMoviesWithCompletion:^(NSArray *movies, NSError *error) {
        self.movies = movies;
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


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
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
    NSString* cellID = CELL_ID_TBVL(indexPath.row);
    VKMovieCell* cell = (VKMovieCell*)[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (indexPath.row > 0) {
        [cell setMovie:self.movies[indexPath.row]];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (indexPath.row == 0) ? 175.0f : 75.0f;
    
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning - stub data
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VKMovieCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID_MOVIECOLLECTIONVIEW forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate


#pragma mark - VKMenuDelegate

- (void)menuDidSelectItem:(MenuItem)menuItem {
    
    NSLog(@"%i", menuItem);
}

#pragma mark - Private


@end
