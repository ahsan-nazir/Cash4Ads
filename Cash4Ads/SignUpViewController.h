//
//  SignUpViewController.h
//  Cash4Ads
//
//  Created by apple on 6/1/16.
//  Copyright © 2016 ahsan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
- (IBAction)backBtnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;
- (IBAction)signUpBtnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordFiled;

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@end
