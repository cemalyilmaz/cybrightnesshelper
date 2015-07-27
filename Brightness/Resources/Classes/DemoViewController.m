//
//  ViewController.m
//  Brightness
//
//  Created by Cemal Yilmaz on 27/07/15.
//  Copyright (c) 2015 Rethib. All rights reserved.
//

#import "DemoViewController.h"
#import "BrightnessHelper.h"

@interface DemoViewController ()

@property (nonatomic, weak) IBOutlet UISlider *slider;

@end

@implementation DemoViewController

- (IBAction)saveBrightness:(id)sender {
    [BrightnessHelper save];
}

- (IBAction)restoreBrightness:(id)sender {
    [BrightnessHelper restore];
    _slider.value = [BrightnessHelper currentBrightness];
}

- (IBAction)valueChanged:(id)sender {
    [BrightnessHelper setBrightness:_slider.value];
}

@end
