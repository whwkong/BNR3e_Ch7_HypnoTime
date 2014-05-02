//
//  TimeViewController.h
//  HypnoTime
//
//  Created by William Kong on 1/10/2014.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController
{
    IBOutlet UILabel    *timeLabel;
}
- (IBAction)showCurrentTime:(id)sender;
@end
