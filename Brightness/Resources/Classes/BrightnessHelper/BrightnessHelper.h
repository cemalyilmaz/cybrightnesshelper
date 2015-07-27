//
//  BrightnessHelper.h
//  Brightness
//
//  Created by Cemal Yilmaz on 27/07/15.
//  Copyright (c) 2015 Rethib. All rights reserved.

#import <UIKit/UIKit.h>

@interface BrightnessHelper : NSObject

+ (instancetype) helper;

+ (void) save;
+ (void) restore;

+ (void) setBrightness:(CGFloat) brightness;
+ (CGFloat) currentBrightness;

@end
