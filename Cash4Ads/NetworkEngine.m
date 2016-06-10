//
//  NetworkEngine.m
//  ClinicApp
//
//  Created by Muneeb on 4/4/14.
//  Copyright (c) 2014 One That Matters. All rights reserved.
//

#import "NetworkEngine.h"
#import "Globals.h"

@implementation NetworkEngine


static NetworkEngine *manager = nil;
/**
 *  Factory method
 *
 *  @return returns instances of DKNetworkEngine
 */
+(NetworkEngine*)sharedNetworkEngine{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NetworkEngine alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        
        manager.baseURL = [NSURL URLWithString:BASE_URL];
    });
    
    return manager;
}

-(void)setURL:(NSString*)urlString
{
    manager.baseURL = [NSURL URLWithString:urlString];
}

-(AFHTTPRequestOperation *)getHeadingsWithDataWithCompletionHandler:(CompletionHandler)comBlock errorHandler:(ErrorHandler)errBlock{
    
    NSString *fullname=@"AHSAN NAZIR";
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"AuthenticationToken"];
    NSString *savedValue1 = [[NSUserDefaults standardUserDefaults]
                             stringForKey:@"UserId"];

     NSString *MPC=[NSString stringWithFormat:@"%@/%@/?UserId=%@",GetNewsList,savedValue,savedValue1];
    
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:fullname,@"AuthenticationToken",fullname,@"Password",
                            nil];
    
    NSLog(@"complete data set is here %@",params);

    
    AFHTTPRequestOperation* op = [manager GET:MPC
                                    parameters:nil
                                       success:comBlock
                                       failure:errBlock];
    NSLog(@"here is the Op %@",op.request);
    
    return op;
}
-(AFHTTPRequestOperation *)submitRegisterUser :(NSString*)Name :(NSString*)Email :(NSString*)Paswword dataWithCompletionHandler:(CompletionHandler)comBlock errorHandler:(ErrorHandler)errBlock
{
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:Name ,@"FullName",Email ,@"Email",Paswword ,@"Password",nil];
    
    NSLog(@"here is the Data To be Posted %@",params);
    
    NSString *MPC=[NSString stringWithFormat:@"%@?FullName=%@&Email=%@&Password=%@",GetRegisterUserEmail,Name,Email,Paswword];
    
    AFHTTPRequestOperation* op = [manager POST:MPC
                                    parameters:nil
                                       success:comBlock
                                       failure:errBlock];
   //  op.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    return op;
}
-(AFHTTPRequestOperation *)LoginUserMPC :(NSString*)Email :(NSString*)Paswword dataWithCompletionHandler:(CompletionHandler)comBlock errorHandler:(ErrorHandler)errBlock
{
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:Email ,@"UserName",Paswword ,@"Password",nil];
    
    NSLog(@"here is the Data To be Posted %@",params);
    
    NSString *MPC=[NSString stringWithFormat:@"%@?&UserName=%@&Password=%@",GetRegisterUser,Email,Paswword];
    
    AFHTTPRequestOperation* op = [manager GET:MPC
                                    parameters:nil
                                       success:comBlock
                                       failure:errBlock];
    //  op.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    return op;

}

@end
