//
//  Business.m
//  DrupalMapApp
//
//  Created by Jeffrey Linwood on 3/10/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import "Business.h"

@implementation Business
@synthesize longitude = _longitude;
@synthesize latitude = _latitude;
@synthesize imageURI = _imageURI;

- (CLLocationCoordinate2D) coordinate {
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

@end
