//
//  BusinessViewController.m
//  DrupalMapApp
//
//  Created by Jeffrey Linwood on 3/12/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import "BusinessViewController.h"

#import "UIImageView+AFNetworking.h"

#import "AppData.h"

@interface BusinessViewController ()

@end

@implementation BusinessViewController
@synthesize nameLabel = _nameLabel;
@synthesize bodyLabel = _bodyLabel;
@synthesize imageView = _imageView;
@synthesize business = _business;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Business";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if (self.business != nil) {
        self.nameLabel.text = self.business.title;
        self.bodyLabel.text = self.business.body;
        
        //handle image
        NSURL *imageURL = [NSURL URLWithString:[AppData imageURLFromImageURI:self.business.imageURI]];
        [self.imageView setImageWithURL:imageURL];
        
    }
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
