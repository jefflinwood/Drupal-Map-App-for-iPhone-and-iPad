//
//  MapViewController.m
//  DrupalMapApp
//
//  Created by Jeffrey Linwood on 3/10/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import "MapViewController.h"

#import "AFJSONRequestOperation.h"
#import "SVProgressHUD.h"

#import "AppData.h"
#import "Business.h"

@interface MapViewController ()
- (void) loadMapData;
- (void) zoomToFitMapAnnotations:(MKMapView*)annotatedMapView;
@end

@implementation MapViewController
@synthesize mapView = _mapView;


//common method for both iPhone and iPad, called before either present their view controllers
- (void) openBusiness:(id)sender {
    NSLog(@"Opening business with node id: %d",[sender tag]);
}


- (MKAnnotationView *) mapView: (MKMapView *) theMapView viewForAnnotation: (id<MKAnnotation>) annotation
{
	Business* business = annotation;
    MKPinAnnotationView *pin = (MKPinAnnotationView *) [theMapView dequeueReusableAnnotationViewWithIdentifier: @"pin"];
	if (pin == nil)
	{
		pin = [[MKPinAnnotationView alloc] initWithAnnotation: annotation reuseIdentifier: @"pin"];
	}
	else
	{
		pin.annotation = annotation;
	}
    
	if ([annotation isKindOfClass:[MKUserLocation class]])
	{
		pin.pinColor = MKPinAnnotationColorPurple;
		pin.canShowCallout = NO;
		return nil;
	}
	else 
	{
		pin.canShowCallout = YES;
		
		// add a detail disclosure button to the callout which will open a new view controller page
		UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		
        rightButton.tag = [business nid];
		[rightButton addTarget:self action:@selector(openBusiness:)
			  forControlEvents:UIControlEventTouchUpInside];
        
		pin.rightCalloutAccessoryView = rightButton;
        
	}
	pin.animatesDrop = YES;
	return pin;
}

- (void) loadMapData {
	
    NSArray *annotations = [self.mapView annotations];
	if (annotations != nil) {
		[self.mapView removeAnnotations:annotations];
	}
	
	[self.mapView addAnnotations: [[AppData sharedInstance] businesses]];
	
	[self zoomToFitMapAnnotations:self.mapView];
}



//from http://codisllc.com/blog/zoom-mkmapview-to-fit-annotations/
-(void)zoomToFitMapAnnotations:(MKMapView*)annotatedMapView
{
    if([annotatedMapView.annotations count] == 0)
        return;
    
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    for(id<MKAnnotation> annotation in annotatedMapView.annotations)
    {
		if (![annotation isKindOfClass:[MKUserLocation class]]) {
			topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
			topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
			
			bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
			bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
		}
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.2; // Add a little extra space on the sides
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.2; // Add a little extra space on the sides
    
    region = [annotatedMapView regionThatFits:region];
    [annotatedMapView setRegion:region animated:YES];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Map";
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated{
    if ([[[AppData sharedInstance] businesses] count] != 0) {
        //we've already loaded data once for this app, so just display it on the map
        [self loadMapData];
    } else {
        [SVProgressHUD showWithStatus:@"Retrieving Data"];
        
        NSURL *url = [AppData drupalURLForPath:@"/views/businesses.json"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            
            //store results from the view into the application wide data
            [[AppData sharedInstance] storeResults:JSON];
            [self loadMapData];
            
            [SVProgressHUD dismissWithSuccess:@"Downloaded"];
            
        }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            [SVProgressHUD dismissWithError:@"Unable to download data" afterDelay:5];
        }];
        [operation start]; 
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
