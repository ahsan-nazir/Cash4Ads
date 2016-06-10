//
//  Globals.m
//  Backgrounds
//
//  Created by AHSAN NAZIR RAJA on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Globals.h"

@implementation Globals

@synthesize headingArray,headingBrickopedia,headingDownloads,description,titleString,headingNews,fromBeickDetailView,memberID,fromNewsNotifications,priceString,calleriesString,urlForImage,urlForImageNews,titleNews,detailsNews,userRating,userProfileImage,foodCatID,categoryRating,ingredientsForFoodItems,branchIDString;



static Globals *singletonObject = nil;
- (id) init
{
//	self = [super init];
	if (self = [super init]) {
        
        headingNews=@"NEWS";
       
      
        headingBrickopedia=@"BRICKOPEDIA";
        headingDownloads=@"DOWNLOADS";
//
              
}
	return self;
}

+(Globals *) sharedInstance{
	@synchronized(self){
		if(singletonObject == nil){
			singletonObject = [[self alloc] init];
		}
	}
	return singletonObject;
}


@end
