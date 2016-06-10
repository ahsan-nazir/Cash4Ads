//
//  SignInViewController.h
//  Cash4Ads
//
//  Created by apple on 6/1/16.
//  Copyright © 2016 ahsan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iToast.h"

@interface SignInViewController : UIViewController
- (IBAction)BackBtnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *signInBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerNowBtn;
- (IBAction)signInBtnPressed:(id)sender;

@end
