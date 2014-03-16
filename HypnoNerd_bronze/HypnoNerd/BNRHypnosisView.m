//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Tom on 3/9/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView()

@property (strong, nonatomic) UIColor *circleColor;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;

@end

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
        self.segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"RED",
                                                                           @"GREEN",
                                                                           @"BLUE"]];
        self.segmentedControl.frame = CGRectMake(35, 20, 250, 50);
        [self.segmentedControl addTarget:self action:@selector(pickone:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:self.segmentedControl];
    }
    return self;
}

-(void)pickone:(id)sender
{
    //NSLog(@"user picked color");
    int i = [self.segmentedControl selectedSegmentIndex];
    
    switch (i) {
        case 0:
            [self setCircleColor:[UIColor redColor]];
            break;
        case 1:
            [self setCircleColor:[UIColor greenColor]];
            break;
        case 2:
            [self setCircleColor:[UIColor blueColor]];
            break;
        default:
            break;
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2.0;
    
    // The circle will be the largest that will fit in the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -=20)
    {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [path stroke];
}

-(void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

// Override touch event
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    self.segmentedControl.selectedSegmentIndex = -1;
    
    // Get 3 random numbers between 0 and 1
    float red = (arc4random()%100)/100.0;
    float green = (arc4random()%100)/100.0;
    float blue = (arc4random()%100)/100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    self.circleColor = randomColor;
}

@end
