//
//  HomeViewController.m
//  Cash4Ads
//
//  Created by apple on 6/6/16.
//  Copyright © 2016 ahsan. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"AuthenticationToken"];
    NSString *savedValue1 = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"UserId"];

    
    NSLog(@"here is AuthenticationToken %@",savedValue);
    NSLog(@"here is UserId %@",savedValue1);
    
    [self GetNewsListMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)GetNewsListMethod
{
    
     // arrMenue = [[NSMutableArray alloc]init];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    
    
    
    [[NetworkEngine sharedNetworkEngine]getHeadingsWithDataWithCompletionHandler:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        
        
        NSLog(@"here is the json Object %@",responseObject);
        NSString *status=[responseObject objectForKey:@"status"];
        
        //  arrMenue=[responseObject objectForKey:@"data"];
        
        
        if ([status isEqualToString:@"1"])
        {
            
          //  arrNewsItems=[responseObject objectForKey:@"Products"];
            
           
            // NSDictionary *brickdic=[[carImages objectAtIndex:0]objectForKey:@"data"];
            
            
        }
        else
        {
            [[[UIAlertView alloc] initWithTitle:@"Error" message:[responseObject objectForKey:@"message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        }
        
    } errorHandler:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        if (error.code != NSURLErrorCancelled) {
            
            
            NSLog(@"Here Is the ERROR in Response %@",error);
            
            [[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil, nil] show];
        }
    }];
    
    
}

@end
