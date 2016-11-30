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
    NSTimer* m_timer;
    NSInteger counter;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    counter = 25;
}

- (void)viewDidAppear:(BOOL)animated {
    // Kick off a timer to count it down
    m_timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(decrementSpin) userInfo:nil repeats:YES];
}

- (void)decrementSpin {
    CGFloat maxValue = 300;
    if (counter == maxValue ) {
        [m_timer invalidate];
        m_timer = nil;
        counter = 0;
    } else {
        [testView setMaxDuration:maxValue
                andCurrentDuration:maxValue-counter];
        counter++;
    }
}

@end
