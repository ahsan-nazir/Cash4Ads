//
//  ProfileViewController.h
//  Cash4Ads
//
//  Created by apple on 6/6/16.
//  Copyright © 2016 ahsan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *editProfileBtn;

@property (weak, nonatomic) IBOutlet UIButton *refferalBtn;
- (IBAction)refferalClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cashOutBtn;

@end
