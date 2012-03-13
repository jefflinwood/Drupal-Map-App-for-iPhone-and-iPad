//
//  BusinessViewController_iPad.m
//  DrupalMapApp
//
//  Created by Jeffrey Linwood on 3/12/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import "BusinessViewController_iPad.h"

@interface BusinessViewController_iPad ()

@end

@implementation BusinessViewController_iPad

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
