//
//  TimerArcView.h
//  TimerArcView
//
//  Created by iOS Dev Team on 26/11/16.
//  Copyright © 2016 Punchh Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kArcWidth 10.f
#define kArcBackColor [UIColor grayColor]
#define kArcPathColor [UIColor lightGrayColor]
#define kArcDotColor [UIColor redColor]

@interface TimerArcView : UIView

@property (nonatomic) NSInteger percent;

- (void)setMaxDuration:(CGFloat)maxDuration
    andCurrentDuration:(CGFloat)currentDuration;

@end
