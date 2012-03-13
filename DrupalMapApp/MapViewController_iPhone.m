//
//  MapViewController_iPhone.m
//  DrupalMapApp
//
//  Created by Jeffrey Linwood on 3/10/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import "MapViewController_iPhone.h"

#import "AppData.h"

#import "BusinessViewController_iPhone.h"

@interface MapViewController_iPhone ()

@end

@implementation MapViewController_iPhone

- (void) openBusiness:(id)sender  {
    [super openBusiness:sender];
    BusinessViewController_iPhone *businessViewController = [[BusinessViewController_iPhone alloc] initWithNibName:@"BusinessViewController_iPhone" bundle:nil];
    int nid = [sender tag];
    businessViewController.business = [[AppData sharedInstance] businessForNodeId:nid];
    [self.navigationController pushViewController:businessViewController animated:YES];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
