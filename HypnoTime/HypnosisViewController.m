//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by William Kong on 1/10/2014.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

- (void) loadView
{
    // Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];
    
    // set it as *the* view for this controller
    [self setView:v];
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // call the superclass' designated initializer
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        // get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        // give it a label
        [tbi setTitle:@"Hypnosis"];
        
        // create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        // Put that image on the tab bar item
        [tbi setImage:i];
    }
    
    
    return self;
}

- (void) viewDidLoad
{
    // always call the super's implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewController loaded its view");
}


@end
