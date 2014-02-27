//
//  HTMKagoViewController.m
//  Mushitori
//
//  Created by あき on 14/02/08.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import "HTMKagoViewController.h"
#import "HTMGameState.h"


@implementation HTMKagoViewController

@synthesize state;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _imageCyo.hidden = YES ;    //image を非表示
    _imageHachi.hidden = YES ;    //image を非表示
    _imageSuzume.hidden = YES ;    //image を非表示
    _imageTento.hidden = YES ;    //image を非表示
    _imageTonbo.hidden = YES ;    //image を非表示

    if (state.haveCho) _imageCyo.hidden = NO ;    //image を表示
    if (state.haveHachi) _imageHachi.hidden = NO ;    //image を表示
    if (state.haveTento) _imageTento.hidden = NO ;    //image を表示
    if (state.haveTonbo) _imageTonbo.hidden = NO ;    //image を表示
    if (state.haveSuzumeBachi) _imageSuzume.hidden = NO ;    //image を表示
	
    NSString *timeShow = [NSString stringWithFormat:@"%.1f (秒)",state.time];
    _timeText1.text = timeShow;
    
    
    LOG(@"蝶フラグ：%d", self.state.haveCho);
    LOG(@"蜂フラグ：%d", self.state.haveHachi);
    LOG(@"トンボフラグ：%d", self.state.haveTonbo);
    LOG(@"テントウフラグ：%d", self.state.haveTento);
    LOG(@"スズメ蜂フラグ：%d", self.state.haveSuzumeBachi);
    LOG(@"タイム：%.1f 秒", self.state.time);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
