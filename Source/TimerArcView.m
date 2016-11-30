//
//  TimerArcView.m
//  TimerArcView
//
//  Created by iOS Dev Team on 26/11/16.
//  Copyright © 2016 Punchh Inc. All rights reserved.
//

#import "TimerArcView.h"

#define KADegreesToRadians(degrees) ((degrees)/180.0*M_PI)
#define KARadiansToDegrees(radians) ((radians)*180.0/M_PI)

@interface TimerArcView () {
    CGFloat startAngle;
    CGFloat endAngle;
    UILabel *endLabel;
}

@end

@implementation TimerArcView

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        [self designArc];
    }
    return self;
}

- (void)designArc {
    startAngle = endAngle =  0;
    endLabel = [[UILabel alloc] initWithFrame:self.frame];
    endLabel.backgroundColor = kArcDotColor;
    endLabel.layer.cornerRadius = kArcWidth;
    endLabel.layer.masksToBounds  = YES;
    endLabel.hidden = YES;
    [self addSubview:endLabel];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat archXPos = self.frame.size.width/2 ;
    CGFloat archYPos = self.frame.size.height/2 ;
    CGFloat trackStartAngle = KADegreesToRadians(0);
    CGFloat trackEndAngle = KADegreesToRadians(360);
    
    // Track
    CGContextSetStrokeColorWithColor(context, kArcPathColor.CGColor);
    CGContextSetLineWidth(context, kArcWidth);
    CGContextAddArc(context, archXPos,archYPos, self.frame.size.width/2 - (kArcWidth/2), trackStartAngle, trackEndAngle, 1);
    CGContextStrokePath(context);

    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width/2, rect.size.height/2)
                          radius:rect.size.width/2 - (kArcWidth/2)
                      startAngle:startAngle
                        endAngle:endAngle
                       clockwise:YES];
    
    endLabel.frame = CGRectMake(bezierPath.currentPoint.x - kArcWidth,
                                bezierPath.currentPoint.y - kArcWidth,
                                kArcWidth * 2,
                                kArcWidth * 2);
    bezierPath.lineWidth = kArcWidth;
    [kArcBackColor setStroke];
    [bezierPath stroke];
}

- (void)setMaxDuration:(CGFloat)maxDuration
    andCurrentDuration:(CGFloat)currentDuration {
    startAngle = 3 * M_PI_2;
    endAngle = -(startAngle + ((M_PI*2.0) * (((maxDuration - currentDuration) / maxDuration) - 0.50)));
    endLabel.hidden = NO;
    self.percent = self.percent - 1;
    [self setNeedsDisplay];
}

@end