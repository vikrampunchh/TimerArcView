//
//  ViewController.m
//  TestProgress
//
//  Created by GauravDS on 26/11/16.
//  Copyright © 2016 baltech. All rights reserved.
//

#import "ViewController.h"
#import "TimerArcView.h"

@interface ViewController (){
    __weak IBOutlet TimerArcView * testView;
    NSTimer* timer;
    NSInteger counter;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    counter = 100;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                               target:self
                                             selector:@selector(decrementSpin)
                                             userInfo:nil
                                              repeats:YES];
}

- (void)decrementSpin {
    CGFloat maxValue = 300;
    if (counter == maxValue ) {
        [timer invalidate];
        timer = nil;
        counter = 0;
    } else {
        [testView setMaxDuration:maxValue
                andCurrentDuration:maxValue-counter];
        counter++;
    }
}

@end
