//
//  CHNetWorking.m
//  smallDay
//
//  Created by 陈欢 on 2017/12/30.
//  Copyright © 2017年 陈欢. All rights reserved.
//

#import "CHNetWorking.h"
@interface CHNetWorking()



@end

@implementation CHNetWorking

static CHNetWorking *shareManager = nil;
static dispatch_once_t onceToken;


+ (CHNetWorking *)sharedManager {
    
    
   
    dispatch_once(&onceToken, ^{
        
        
        
        shareManager = [[CHNetWorking alloc] initWithBaseURL:nil];
    });
    
    return shareManager;
    
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
    
    self.securityPolicy.allowInvalidCertificates = YES;
    
    return self;
}

- (void)getWithUrlString:(NSString *)url withParams:(NSDictionary *)params andBlock:(void (^)(id, NSError *))block {
    
    [self GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        block(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        block(nil,error);
        
    }];
    
}





@end
