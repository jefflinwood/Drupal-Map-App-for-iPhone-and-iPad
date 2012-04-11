//
//  AppHelper.m
//  DrupalMobileAppBoilerplateIOS
//
//  Created by Jeffrey Linwood on 3/7/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import "AppHelper.h"

@implementation AppHelper

// is this an iPad app?
+ (BOOL) iPad {
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

// helper method to get field values from Drupal 7 JSON nodes
+ (NSString*) extractDrupalFieldValue:(NSDictionary*) node fieldName:(NSString*)fieldName fieldAttr:(NSString*)fieldAttr {
    if (!([[node objectForKey:fieldName] isKindOfClass:[NSDictionary class]])) {
        return nil;
    }
    NSDictionary* fieldDict = [[[node objectForKey:fieldName] objectForKey:@"und"] objectAtIndex:0];
    return [fieldDict objectForKey:fieldAttr];
}

//helper method to make multiline UILabels start the text at the top instead
//of having vertical text alignment
+ (void) topAlignLabel:(UILabel *)label height:(float)height {
    //resize label to top align text by modifying the frame
    CGSize textSize = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(label.frame.size.width, MAXFLOAT) lineBreakMode:label.lineBreakMode];
    int newTextSizeHeight = height;
    if (textSize.height < newTextSizeHeight) {
        newTextSizeHeight = textSize.height;
    }
    
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, newTextSizeHeight);
}
@end
