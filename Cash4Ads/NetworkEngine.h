//
//  NetworkEngine.h
//  ClinicApp
//
//  Created by Muneeb on 4/4/14.
//  Copyright (c) 2014 One That Matters. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import <CoreLocation/CoreLocation.h>
//#import "Globals.h"

#define BASE_URL @""




#define GetNewsList @"http://manage.cash4ads.com/Api_Mobile/Products/"
#define GetRegisterUser @"http://manage.cash4ads.com/Api_Mobile/Login/Standard/"
#define GetRegisterUserEmail @"http://manage.cash4ads.com/Api_Mobile/Register/Custom/"


typedef void (^ErrorHandler)(AFHTTPRequestOperation *operation, NSError *error);
typedef void (^CompletionHandler)(AFHTTPRequestOperation *operation, id responseObject);

@interface NetworkEngine : AFHTTPRequestOperationManager{

}

@property (nonatomic, strong, readwrite) NSURL* baseURL;

+(NetworkEngine*)sharedNetworkEngine;

-(void)setURL:(NSString*)urlString;

-(AFHTTPRequestOperation *)getHeadingsWithDataWithCompletionHandler:(CompletionHandler)comBlock errorHandler:(ErrorHandler)errBlock;
-(AFHTTPRequestOperation *)submitRegisterUser :(NSString*)Name :(NSString*)Email :(NSString*)Paswword dataWithCompletionHandler:(CompletionHandler)comBlock errorHandler:(ErrorHandler)errBlock;

-(AFHTTPRequestOperation *)LoginUserMPC :(NSString*)Email :(NSString*)Paswword dataWithCompletionHandler:(CompletionHandler)comBlock errorHandler:(ErrorHandler)errBlock;

@end
