//
//  MapViewController_iPad.m
//  DrupalMapApp
//
//  Created by Jeffrey Linwood on 3/10/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import "MapViewController_iPad.h"

#import "AppData.h"

#import "BusinessViewController_iPad.h"

@interface MapViewController_iPad ()

@end

@implementation MapViewController_iPad

- (void) openBusiness:(id)sender {
    [super openBusiness:sender];
    [super openBusiness:sender];
    BusinessViewController_iPad *businessViewController = [[BusinessViewController_iPad alloc] initWithNibName:@"BusinessViewController_iPad" bundle:nil];
    int nid = [sender tag];
    businessViewController.business = [[AppData sharedInstance] businessForNodeId:nid];
    businessViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentModalViewController:businessViewController animated:YES];
    
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
	return YES;
}

@end
