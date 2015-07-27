//
//  BrightnessHelper.m
//  Brightness
//
//  Created by Cemal Yilmaz on 27/07/15.
//  Copyright (c) 2015 Rethib. All rights reserved.
//

#import "BrightnessHelper.h"

@interface BrightnessHelper ()

@property (nonatomic, strong) NSMutableArray *stack;

@end

@implementation BrightnessHelper

+ (instancetype) helper {
    static dispatch_once_t once;
    static BrightnessHelper *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.stack = [NSMutableArray array];
    }
    return self;
}

+ (void) save {
    NSNumber *value = @([self currentBrightness]);
    
    BrightnessHelper *helper = [BrightnessHelper helper];
    [helper.stack addObject:value];
}

+ (void) restore {
    BrightnessHelper *helper = [BrightnessHelper helper];
    NSNumber *number = [helper.stack lastObject];
    
    if(number) {
        [helper.stack removeLastObject];
        CGFloat brightness = [number floatValue];
        [UIScreen mainScreen].brightness = brightness;
    }
}

+ (void) setBrightness:(CGFloat) brightness {
    [UIScreen mainScreen].brightness = brightness;
}

+ (CGFloat) currentBrightness {
    return [UIScreen mainScreen].brightness;
}

@end
