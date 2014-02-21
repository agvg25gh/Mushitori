//
//  HTMGameViewController.h
//  Mushitori
//
//  Created by あき on 14/02/08.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMGameState.h"

@interface HTMGameViewController : UIViewController {
    // インスタンス変数
    HTMGameState *_state;
    NSTimer *_timer;
    NSDate *_startDate;
}
@property (strong, nonatomic) IBOutlet UIView *BaseView;
@property (weak, nonatomic) IBOutlet UIImageView *Cho;
@property (weak, nonatomic) IBOutlet UIImageView *Hachi;
@property (weak, nonatomic) IBOutlet UIImageView *Tento;
@property (weak, nonatomic) IBOutlet UIImageView *SuzumeBachi;
@property (weak, nonatomic) IBOutlet UILabel *lblMsg;
@property (weak, nonatomic) IBOutlet UIButton *btnReTry;
- (IBAction)onReTryClick:(id)sender;

@end
