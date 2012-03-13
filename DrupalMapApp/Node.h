//
//  Node.h
//  DrupalMapApp
//
//  Created by Jeffrey Linwood on 3/10/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic, assign) NSUInteger nid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *teaser;
@property (nonatomic, strong) NSString *body;

@end
