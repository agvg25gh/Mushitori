//
//  HTMOptionViewController.h
//  Mushitori
//
//  Created by あき on 2014/03/16.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTMOptionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *slider;
- (IBAction)onClick:(UIButton *)sender;
- (IBAction)onSliderChanged:(UISlider *)sender;

@end
