//
//  AppHelper.h
//  DrupalMobileAppBoilerplateIOS
//
//  Created by Jeffrey Linwood on 3/7/12.
//  Copyright (c) 2012 Jeff Linwood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppHelper : NSObject

//is this app an iPad app
+ (BOOL) iPad;

// helper method to get field values from Drupal 7 JSON nodes
+ (NSString*) extractDrupalFieldValue:(NSDictionary*) node fieldName:(NSString*)fieldName fieldAttr:(NSString*)fieldAttr;

//helper method to make multiline UILabels start the text at the top instead
//of having vertical text alignment
+ (void) topAlignLabel:(UILabel *)label height:(float)height;
@end
