//
//  SignInViewController.m
//  Cash4Ads
//
//  Created by apple on 6/1/16.
//  Copyright © 2016 ahsan. All rights reserved.
//

#import "SignInViewController.h"
#import "NetworkEngine.h"
#import "MBProgressHUD.h"
#import "HomeViewController.h"


@interface SignInViewController ()
{
    NSMutableData *mutableData;
    
#define URL            @"http://manage.cash4ads.com/Api_Mobile/Register/Custom/"  // change this URL
#define NO_CONNECTION  @"No Connection"
#define NO_VALUES      @"Please enter parameter values"

}

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_emailField becomeFirstResponder];
    
    _signInBtn.layer.cornerRadius = 10; // this value vary as per your desire
    _signInBtn.clipsToBounds = YES;
    
    _registerNowBtn.layer.cornerRadius = 10; // this value vary as per your desire
    _registerNowBtn.clipsToBounds = YES;

    
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

- (IBAction)BackBtnClicked:(id)sender
{
   
}
-(void)UserLogInAction
{
    
    
//    if(![_passwordField.text isEqualToString:_confirmPasswordFiled.text])
//    {
//        
//        
//        
//        [[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Password and Confirm Password must be same" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
//        return;
//        
//        
//    }
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    [[NetworkEngine sharedNetworkEngine] LoginUserMPC:_emailField.text:_passwordField.text
                                  dataWithCompletionHandler:^(AFHTTPRequestOperation *operation, id responseObject) {
                                      
                                      [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                                      
                                      
                                      
                                      NSLog(@"here is the json Object %@",responseObject);
                                      NSString *status=[responseObject objectForKey:@"Status"];
                                      
                                      NSLog(@"status code is here %@",status);
                                      BOOL boolValue = [status boolValue];
                                      if (boolValue)
                                      {
                                           NSDictionary *dataDict=[responseObject objectForKey:@"User"];
                                          NSLog(@"here is nuser Data %@",dataDict);
                                          
                                          NSString *valueToSave = [dataDict objectForKey:@"AuthenticationToken"];
                                          
                                          NSString *valueToSave1 = [dataDict objectForKey:@"UserId"];
                                          
                                          [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"AuthenticationToken"];
                                          [[NSUserDefaults standardUserDefaults] setObject:valueToSave1 forKey:@"UserId"];
                                          
                                          [[NSUserDefaults standardUserDefaults] synchronize];
                                          
//                                          UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:[responseObject objectForKey:@"Message"] preferredStyle:UIAlertControllerStyleAlert];
//                                          
//                                          UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//                                          [alertController addAction:ok];
//                                          
//                                          [self presentViewController:alertController animated:YES completion:nil];
                                          NSString * storyboardName = @"Main";
                                          NSString * viewControllerID = @"signUpshow";
                                          UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
                                          HomeViewController * controller = (HomeViewController *)[storyboard instantiateViewControllerWithIdentifier:viewControllerID];
                                          [self presentViewController:controller animated:YES completion:nil];

                                          
                                          
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



- (IBAction)signInBtnPressed:(id)sender
{
    [self UserLogInAction];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}
@end
