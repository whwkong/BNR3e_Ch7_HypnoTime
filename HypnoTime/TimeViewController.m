//
//  TimeViewController.m
//  HypnoTime
//
//  Created by William Kong on 1/10/2014.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "TimeViewController.h"

@implementation TimeViewController

- (IBAction)showCurrentTime:(id)sender
{
    NSDate *now = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setTimeStyle:NSDateFormatterMediumStyle];

    [timeLabel setText:[formatter stringFromDate:now]];
                   
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // call the superclass' designated initializer
    
    
    // self = [super initWithNibName:nil bundle:nil];
    // passing nil to both arguments above has same effect as the code below - we're just making it more
    // explicit.
    //
    // get a pointer to application bundle object
    NSBundle *appBundle = [NSBundle mainBundle];
    
    self = [super initWithNibName:@"TimeViewController" bundle:appBundle];
    
    
    
    if (self) {
        // get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        // give it a label
        [tbi setTitle:@"Time"];
        
        // create a UIImage from a file
        // This will use Time@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        
        // Put that image on the tab bar item
        [tbi setImage:i];
        
        [[self view] setBackgroundColor:[UIColor greenColor]];
    }
    
    
    return self;
}

- (void) viewDidLoad
{
    // always call the super's implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"TimeViewController loaded its view");
}

- (void) viewDidUnload
{
    [super viewDidUnload];
    NSLog(@"Unloading TimeViewController's views");
}

- (void) viewWillAppear:(BOOL)animated
{
    NSLog(@"CurrentTimeViewController will appear.");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}

- (void) viewWillDisappear:(BOOL)animated
{
    NSLog(@"CurrentTimeViewController will DISappear.");
    [super viewWillDisappear:animated];
}

@end
