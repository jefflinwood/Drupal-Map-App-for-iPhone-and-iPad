//
//  Business.h
//  DrupalMapApp
//
//  Created by Jeffrey Linwood on 3/10/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import "Node.h"

#import <MapKit/MapKit.h>

@interface Business : Node <MKAnnotation>

@property (nonatomic, strong) NSString *imageURI;

@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, assign) CLLocationDegrees longitude;

@end
