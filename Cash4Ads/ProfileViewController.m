//
//  ProfileViewController.m
//  Cash4Ads
//
//  Created by apple on 6/6/16.
//  Copyright © 2016 ahsan. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _editProfileBtn.layer.cornerRadius = 10; // this value vary as per your desire
    _editProfileBtn.clipsToBounds = YES;
    
    _refferalBtn.layer.cornerRadius = 10; // this value vary as per your desire
    _refferalBtn.clipsToBounds = YES;
    
    _cashOutBtn.layer.cornerRadius = 10; // this value vary as per your desire
    _cashOutBtn.clipsToBounds = YES;


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

- (IBAction)refferalClicked:(id)sender {
}
@end
