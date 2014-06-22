//
//  VKRemoteFacade.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 6/22/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKRemoteFacade.h"

@interface VKRemoteFacade ()

/**
 *  Sends GET request with given parameters and callback object.
 *
 *  @param url      The URL used to initialize and send request.
 *  @param params   The dictionary object used to collect request's parameters.
 *  @param callback The CallbackWithDataAndError object used to handle request finishing.
 */
- (void)sendGETRequest:(NSString *)url parameters:(NSDictionary*)params callback:(CallbackWithDataAndError)callback;

/**
 *  Sends POST request with given parameters and callback object.
 *
 *  @param url      The URL used to initialize and send request.
 *  @param params   The dictionary object used to collect request's parameters.
 *  @param callback The CallbackWithDataAndError object used to handle request finishing.
 */
- (void)sendPOSTRequest:(NSString *)url parameters:(NSDictionary*)params callback:(CallbackWithDataAndError)callback;

/**
 *  Returns parameter if given param name and value are not nil.
 *
 *  @param parameter The parameter's name.
 *  @param value     The parameter's value.
 *
 *  @return An initialized NSDictionary object, or nil if there was a problem creating the object.
 */
- (NSDictionary*)dictionaryForParameter:(NSString*)parameter andValue:(id)value;

@end

@implementation VKRemoteFacade

#pragma mark - Init

- (id)init {
    if (self = [super init]) {
        manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}

#pragma mark - Public

SINGLETON(VKRemoteFacade)


- (void)loadMoviesWithCompletion:(CallbackWithDataAndError)completion {
    
    if (completion) {
        completion(nil, nil);
    }
    
}


#pragma mark - Private

- (void)sendGETRequest:(NSString *)url parameters:(NSDictionary*)params callback:(CallbackWithDataAndError)callback {
    
}

- (void)sendPOSTRequest:(NSString *)url parameters:(NSDictionary*)params callback:(CallbackWithDataAndError)callback {
    
}


- (NSDictionary*)dictionaryForParameter:(NSString*)parameter andValue:(id)value {
    NSDictionary *param = ((value) && (parameter)) ? @{parameter:value} : nil;
    return param;
}

@end
