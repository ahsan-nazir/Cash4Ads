//
//  Globals.h
//  Backgrounds
//
//  Created by AHSAN NAZIR RAJA on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Globals : NSObject
{

       
}

@property (strong,nonatomic)NSArray *headingArray;
@property (strong,nonatomic)NSString *headingNews;
@property (strong,nonatomic)NSString *memberID;
@property (nonatomic) int userRating;

@property (strong,nonatomic)NSString *userProfileImage;

@property (strong,nonatomic)NSString *ingredientsForFoodItems;

@property (strong,nonatomic)NSString *titleString;
@property (strong,nonatomic)NSString *base64StringForImage;
@property (strong,nonatomic)NSString *headingBrickopedia;
@property (strong,nonatomic)NSString *headingDownloads;
@property (strong,nonatomic)NSString *descriptionString;
@property (nonatomic, assign) BOOL fromBeickDetailView;
@property (strong,nonatomic)NSString *priceString;
@property (strong,nonatomic)NSString *branchIDString;

@property (strong,nonatomic)NSString *foodCatID;

@property (strong,nonatomic)NSString *categoryRating;

@property (strong,nonatomic)NSString *urlForImage;

@property (strong,nonatomic)NSString *urlForImageNews;
@property (strong,nonatomic)NSString *titleNews;
@property (strong,nonatomic)NSString *detailsNews;


@property (strong,nonatomic)NSString *calleriesString;

@property (nonatomic, assign) BOOL fromNewsNotifications;

+(Globals *) sharedInstance;

@end
