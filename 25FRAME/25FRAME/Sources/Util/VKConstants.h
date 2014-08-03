//
//  VKConstants.h
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 6/22/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark - VCs

//menu
#define VC_ID_MENU @"VKMenuVC"
#define VC_ID_MAIN_MENU @"VKMainMenuVC"
//content
#define VC_ID_MAIN_NAV @"VC_ID_MAIN_NAV"
#define VC_ID_HOME @"VKHomeVC"

#pragma mark - Segue

#define SEGUE_ID_MOVIE_DETAILS @"SegueId_MovieDetails"
#define SEGUE_ID_TVSERIES_DETAILS @"SegueId_TVSeriesDetails"

#pragma mark - Menu 

#define TAG_VIEW_MOVIES 100
#define TAG_VIEW_ACTORS 101
#define TAG_VIEW_DIRECTORS 102
#define TAG_VIEW_FAVORITES 200
#define TAG_VIEW_HISTORY 201


#define MENU_ICON_MOVIES_SELECTED @"iconMoviesSelected"
#define MENU_ICON_ACTORS_SELECTED @"iconActorsSelected"
#define MENU_ICON_DIRECTORS_SELECTED @"iconDirectorsSelected"
#define MENU_ICON_FAVORITES_SELECTED @"iconFavoritesSelected"
#define MENU_ICON_HISTORY_SELECTED @"iconHistorySelected"

typedef enum {
    MenuItemUndefined = -1,
    MenuItemMovies = TAG_VIEW_MOVIES,
    MenuItemActors = TAG_VIEW_ACTORS,
    MenuItemDirectors = TAG_VIEW_DIRECTORS,
    MenuItemFavorites = TAG_VIEW_FAVORITES,
    MenuItemHistory = TAG_VIEW_HISTORY
}MenuItem;

//(width = 207, 60, 40)
typedef enum {
    MoviePosterWidthUndefined = -1,
    MoviePosterWidth40 = 40,
    MoviePosterWidth60 = 60,
    MoviePosterWidth207 = 207
}MoviePosterWidth;
