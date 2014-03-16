//
//  HTMOptionViewController.m
//  Mushitori
//
//  Created by あき on 2014/03/16.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import "HTMOptionViewController.h"

@interface HTMOptionViewController ()

@end

@implementation HTMOptionViewController

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
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// スタート画面に戻る
- (IBAction)onClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}


// ゲームスピードの調整
- (IBAction)onSliderChanged:(UISlider *)sender {
//    _state.frameRate = _slider.value;
}

@end
