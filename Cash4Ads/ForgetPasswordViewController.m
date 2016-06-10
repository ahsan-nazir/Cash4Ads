//
//  ForgetPasswordViewController.m
//  Cash4Ads
//
//  Created by apple on 6/1/16.
//  Copyright © 2016 ahsan. All rights reserved.
//

#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewController ()

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _resetPassBtn.layer.cornerRadius = 10; // this value vary as per your desire
    _resetPassBtn.clipsToBounds = YES;

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
     [self dismissViewControllerAnimated:YES completion:nil];
}
@end
