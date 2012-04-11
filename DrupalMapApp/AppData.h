//
//  AppData.h
//  DrupalMobileAppBoilerplateIOS
//
//  Created by Jeffrey Linwood on 3/7/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Business.h"

@interface AppData : NSObject

@property (nonatomic, strong) NSArray* businesses;


//data singleton
+ (AppData*) sharedInstance;

//returns a fully qualified URL for a path, so code is independent of server name
+ (NSURL*) drupalURLForPath:(NSString*)path;

//takes results from the Drupal View, and translates into Business objects
- (void) storeResults:(NSArray*)JSON;

//returns a Business object for a given node id
- (Business*) businessForNodeId:(NSUInteger)nid;

//returns an image URL suitable for a UIImageView from a Drupal 7 Image URI (public://something.jpg)
+ (NSString*) imageURLFromImageURI:(NSString*)imageURI;

@end
