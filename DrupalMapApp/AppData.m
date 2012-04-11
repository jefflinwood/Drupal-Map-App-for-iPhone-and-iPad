//
//  AppData.m
//  DrupalMobileAppBoilerplateIOS
//
//  Created by Jeffrey Linwood on 3/7/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import "AppData.h"

#import "AppHelper.h"
#import "Business.h"

#define DRUPAL_PUBLIC_IMG_URL @"http://brkfast.localhost:8082/sites/brkfast.localhost/files/styles/large/public/"
#define DRUPAL_REST_ENDPOINT @"http://brkfast.localhost:8082/rest"


@implementation AppData
@synthesize businesses = _businesses;

static AppData *sharedData = nil;

+ (NSString*) imageURLFromImageURI:(NSString*)imageURI {
    return [imageURI stringByReplacingOccurrencesOfString:@"public://"
                                               withString:DRUPAL_PUBLIC_IMG_URL];
}

- (Business*) businessForNodeId:(NSUInteger)nid {
    //we have all of the businesses stored in the businesses array.
    //we could also make a call over to Drupal, or ask our cache for the node data
    //instead, we'll just go through the business array - if we have too many businesses in here, this will be slow,
    //and we should swich our data structure to an NSDictionary.
    NSUInteger index  = [self.businesses indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        Business *business = (Business*) obj;
        return (business.nid == nid);
    }];
    if (index == NSNotFound) {
        return nil;
    }
    return [self.businesses objectAtIndex:index];
    
}

- (void) storeResults:(NSArray*)JSON {
    NSMutableArray *newBusinesses = [[NSMutableArray alloc] init];
    for (NSDictionary *result in JSON) {
        Business *business = [[Business alloc] init];
        
        //parse out Drupal fields
        business.nid = [[result objectForKey:@"nid"] intValue];
        business.title = [result objectForKey:@"title"];
        business.body = [AppHelper extractDrupalFieldValue:result fieldName:@"body" fieldAttr:@"value"];
        
        business.latitude = [[AppHelper extractDrupalFieldValue:result fieldName:@"field_location" fieldAttr:@"lat"] doubleValue];
        business.longitude = [[AppHelper extractDrupalFieldValue:result fieldName:@"field_location" fieldAttr:@"lon"]doubleValue];
        
        business.imageURI = [AppHelper extractDrupalFieldValue:result fieldName:@"field_image" fieldAttr:@"uri"];

        [newBusinesses addObject:business];
    }
    self.businesses = newBusinesses;
}


//Anything we need to do to initialize the shared data singleton can go here.
+ (AppData*) sharedInstance
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedData = [[AppData alloc] init];
        sharedData.businesses = [[NSArray alloc] init];
        
    });
    return sharedData;
}

+ (NSURL*) drupalURLForPath:(NSString*)path {
    NSString *uri = [NSString stringWithFormat:@"%@%@",DRUPAL_REST_ENDPOINT,path];
    return [NSURL URLWithString:uri];
}

@end
