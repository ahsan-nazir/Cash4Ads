//
//  SignUpViewController.m
//  Cash4Ads
//
//  Created by apple on 6/1/16.
//  Copyright © 2016 ahsan. All rights reserved.
//

#import "SignUpViewController.h"
#import "MBProgressHUD.h"
#import "NetworkEngine.h"
#import "HomeViewController.h"


@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _signUpBtn.layer.cornerRadius = 10; // this value vary as per your desire
    _signUpBtn.clipsToBounds = YES;
    // Do any additional setup after loading the view.
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

- (IBAction)backBtnClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)signUpBtnClicked:(id)sender {
    
    
    if(![_passwordTextfield.text isEqualToString:_confirmPasswordFiled.text])
    {
        
        
        
        [[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Password and Confirm Password must be same" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return;
        
        
    }

        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        [[NetworkEngine sharedNetworkEngine] submitRegisterUser:@"AHSAN":_emailTextField.text:_passwordTextfield.text
                                    dataWithCompletionHandler:^(AFHTTPRequestOperation *operation, id responseObject) {
                                        
                                        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                                        
                                        
                                        
                                        NSLog(@"here is the json Object %@",responseObject);
                                        NSString *status=[responseObject objectForKey:@"Status"];
                                        
                                        NSLog(@"status code is here %@",status);
                                        BOOL boolValue = [status boolValue];
                                        
                                        
                                        NSDictionary *errorDict=[responseObject objectForKey:@"errors"];
                                        
                                        NSDictionary *dataDict=[responseObject objectForKey:@"data"];
                                        
                                        
                                        
                                        if (boolValue)
                                        {
                                            
//                                            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:[responseObject objectForKey:@"Message"] preferredStyle:UIAlertControllerStyleAlert];
//                                            
//                                            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//                                            [alertController addAction:ok];
//                                            
//                                            [self presentViewController:alertController animated:YES completion:nil];
                                            
                                             [self dismissViewControllerAnimated:YES completion:nil];
//                                            
//                                            NSString * storyboardName = @"Main";
//                                            NSString * viewControllerID = @"signUpshow";
//                                            UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
//                                            HomeViewController * controller = (HomeViewController *)[storyboard instantiateViewControllerWithIdentifier:viewControllerID];
//                                            [self presentViewController:controller animated:YES completion:nil];
//                                            
                                            
                                        }
                                        
                                        else
                                        {
                                            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:[responseObject objectForKey:@"Message"] preferredStyle:UIAlertControllerStyleAlert];
                                            
                                            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                            [alertController addAction:ok];
                                            
                                            [self presentViewController:alertController animated:YES completion:nil];

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
