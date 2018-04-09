//
//  CHNetWorking.h
//  smallDay
//
//  Created by 陈欢 on 2017/12/30.
//  Copyright © 2017年 陈欢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef enum {
    
    Get = 0,
    Post,
    Put,
    Delete
    
} NetworkMethod;

typedef NS_ENUM(NSInteger, IllegalContentType) {
    IllegalContentTypeTweet = 0,
    IllegalContentTypeTopic,
    IllegalContentTypeProject,
    IllegalContentTypeWebsite
};


@interface CHNetWorking : AFHTTPSessionManager


+ (CHNetWorking *)sharedManager;

//- (void)requestJsonDataWithPath:(NSString *)aPath withParams:(NSDictionary *)params withMethodType:(NetworkMethod)method andBlock:(void(^)(id data ,NSError *error))block;
//
//- (void)requestJsonDataWithPath:(NSString *)aPath
//                     withParams:(NSDictionary*)params
//                 withMethodType:(NetworkMethod)method
//                  autoShowError:(BOOL)autoShowError
//                       andBlock:(void (^)(id data, NSError *error))block;
//
//- (void)requestJsonDataWithPath:(NSString *)aPath
//                           file:(NSDictionary *)file
//                     withParams:(NSDictionary*)params
//                 withMethodType:(NetworkMethod)method
//                       andBlock:(void (^)(id data, NSError *error))block;

- (void)getWithUrlString:(NSString *)url withParams:(NSDictionary *)params andBlock:(void (^)(id data, NSError *error))block;



- (void)postWithurlString:(NSString *)url withParams:(NSDictionary *)params andBlock:(void (^)(id data, NSError *error))block;

@end












//+ (void)GET:(NSString *)URL parameters:(id)parameters success:(CHHttpRequestSuccess)success failure:(CHHttpRequestFailed)failure;
//
//+ (__kindof NSURLSessionTask *)POST:(NSString *)URL parameters:(id)parameters success:(CHHttpRequestSuccess)success failure:(CHHttpRequestFailed)failure;






























