//
//  HTMKagoViewController.h
//  Mushitori
//
//  Created by Team HTML on 14/02/08.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMGameState.h"

@interface HTMKagoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageCyo;
@property (weak, nonatomic) IBOutlet UIImageView *imageHachi;
@property (weak, nonatomic) IBOutlet UIImageView *imageSuzume;
@property (weak, nonatomic) IBOutlet UIImageView *imageTonbo;
@property (weak, nonatomic) IBOutlet UIImageView *imageTento;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel1;
@property (weak, nonatomic) IBOutlet UITextView *timeText1;
- (IBAction)back:(UIButton *)sender;

@property HTMGameState *state;

@end
