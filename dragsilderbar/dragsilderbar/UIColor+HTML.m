//
//  UIColor+HTML.m
//  NTempure
//
//  Created by longkin on 14/12/22.
//  Copyright (c) 2014年 elsonic.inc. All rights reserved.
//

#import "UIColor+HTML.h"

@implementation UIColor (HTML)

+(UIColor *)ColorFromHtml:(NSString *)htmlcolor{
    unsigned rgbValue = 0;
    
    NSScanner *scanner = [NSScanner scannerWithString:htmlcolor];
    [scanner setScanLocation:1];// bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
