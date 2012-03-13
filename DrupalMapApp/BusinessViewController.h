//
//  BusinessViewController.h
//  DrupalMapApp
//
//  Created by Jeffrey Linwood on 3/12/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Business.h"

@interface BusinessViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *bodyLabel;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) Business *business;

@end
