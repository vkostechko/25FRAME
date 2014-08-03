//
//  VKDataProvider.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/20/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKDataProvider.h"

#import "VKRemoteFacade.h"
#import "VKPersistanceFacade.h"

#import "VKDeviceHardwareHelper.h"
#import "VKDataHelper.h"

#import "VKAlertViewManager.h"


@interface VKDataProvider ()

@property (nonatomic, assign) BOOL isNetworkReachable;

- (void)loadLocalMoviesWithCompletion:(DataProviderCompletionHandler)completion;
- (void)loadLocalGenresWithCompletion:(DataProviderCompletionHandler)completion;


@end

@implementation VKDataProvider

SINGLETON(VKDataProvider)

#pragma mark - Override setters

- (BOOL)isNetworkReachable {
    return [[VKDeviceHardwareHelper instance]isInternetConnected];
}

#pragma mark - public


#pragma mark - Movies 

- (void)loadMoviesWithCompletion:(DataProviderCompletionHandler)completion {
    
    if (self.isNetworkReachable) {
        [[VKRemoteFacade instance]loadMoviesWithCompletion:^(id data, NSError *error) {
           
            if (error) {
                //TODO: handle error
            }else {
                
                NSArray* moviesData = [[VKDataHelper instance]arrayFromJsonData:data];
                [[VKPersistanceFacade instance]saveMoviesWithData:moviesData andCompletionBlock:^(BOOL success, NSError *error) {
                   
                    if (error) {
                        [[VKAlertViewManager instance]showLoadingMoviesErrorAlertView];
                        //TODO: handle error
                    }else {
                        [self loadLocalMoviesWithCompletion:completion];
                    }
                    
                }];
            }
            
        }];
    }else {
        [self loadLocalMoviesWithCompletion:completion];
    }
        
    
}
#pragma mark TV Series

- (void)loadTVSeriesWithCompletion:(DataProviderCompletionHandler)completion {
    if (self.isNetworkReachable) {
        [[VKRemoteFacade instance]loadTVSeriesWithCompletion:^(id data, NSError *error) {
            if (error) {
                [[VKAlertViewManager instance]showLoadingMoviesErrorAlertView];
                //TODO: handle error
            }else {
                NSArray* moviesData = [[VKDataHelper instance]arrayFromJsonData:data];
                [[VKPersistanceFacade instance]saveMoviesWithData:moviesData andCompletionBlock:^(BOOL success, NSError *error) {
                    
                    if (error) {
                        //TODO: handle error
                    }else {
                        [self loadLocalMoviesWithCompletion:completion];
                    }
                    
                }];
            }
            
            
        }];
    }
    
}



#pragma mark - Genres 

- (void)loadGenresWithCompletion:(DataProviderCompletionHandler)completion {
    
    if (self.isNetworkReachable) {
        [[VKRemoteFacade instance]loadListOfGenresWithCompletion:^(id data, NSError *error) {
            if (error) {
                //TODO: show alert
            }else {
                NSArray* genresData = [[VKDataHelper instance]arrayFromJsonData:data];
                [[VKPersistanceFacade instance]saveGenresWithData:genresData andCompletionBlock:^(BOOL success, NSError *error) {
                    if (error) {
                        //handle error
                    }else {
                        //load local stored genres
                        [self loadLocalGenresWithCompletion:completion];
                    }
                }];
                
            }
        }];
    }else {
        [self loadLocalGenresWithCompletion:completion];
    }
    
    
    
}


#pragma mark - Private

- (void)loadLocalMoviesWithCompletion:(DataProviderCompletionHandler)completion {
    
    if (completion) {
        NSArray* movies = [[VKPersistanceFacade instance]allMovies];
        completion(movies, nil);
    }
    
}

- (void)loadLocalGenresWithCompletion:(DataProviderCompletionHandler)completion {
    
    if (completion){
        NSArray* genres = [[VKPersistanceFacade instance]allGenres];
        completion(genres, nil);
    }
    
}



@end
