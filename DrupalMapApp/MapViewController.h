//
//  MapViewController.h
//  DrupalMapApp
//
//  Created by Jeffrey Linwood on 3/10/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

// show the selected business in a view (different between iPhone and iPad)
- (void) openBusiness:(id)sender;
@end
