//
//  HypnosisView.m
//  Hypnosister
//
//  Created by William Kong on 1/6/2014.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

@synthesize circleColor;

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

- (void) drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect bounds = [self bounds];
    
    // figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width /2.0;
    center.y = bounds.origin.y + bounds.size.height /2.0;
    
    // the radius of the circle should be nearly as big as the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // the thickness of the line should be 10 points wide
    CGContextSetLineWidth(ctx, 10);
    
    // the color of the line should be gray (rbg = 0.6, alpha =1.0)
    // CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    // [[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1] setStroke];
    // [[UIColor lightGrayColor] setStroke];
    
    [[self circleColor] setStroke];
    
    // draw concentric circles from outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        // Add a path to the context
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI *2.0,  YES);
        
        // perform drawing instruction; removes path
        CGContextStrokePath(ctx);
    }
    
    // Create a string
    NSString *text =  @"You are getting sleepy...";
    
    // get a font to draw it in
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    // how big is this string when drawn in this font?
    textRect.size = [text sizeWithFont:font];
    
    // let's put that string in the center of the view
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    // Set the fill color of the current context to black
    [[UIColor blackColor] setFill];
    
    // the shadow will move 4 points to the right and 3 points down from the text
    CGSize offset = CGSizeMake( 4, 3);
    
    // the shadow will be dark gray in color
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    
    // Set the shadow of the context with these parameters
    // all subsequent drawing will be shadowed
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    
    
    // draw the string
    [text drawInRect:textRect withFont:font];
    
    
    
    // perform a drawing instruction; draw current shape with current state
    // CGContextStrokePath(ctx);
    
}

- (id) initWithFrame:(CGRect) frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // all HypnosisViews start with a clear background color
        [self setBackgroundColor:[UIColor clearColor]];
        
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    
    return self;
    
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Device shake began!");
        [self setCircleColor:[UIColor redColor]];
    }
}

//
// Override default setter method
// 
- (void) setCircleColor:(UIColor *)clr
{
    circleColor = clr;
    
    [self setNeedsDisplay];
}

@end
