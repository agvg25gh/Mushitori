//
//  HTMOptionViewController.m
//  Mushitori
//
//  Created by Team HTML on 2014/03/16.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import "HTMOptionViewController.h"

@interface HTMOptionViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
- (IBAction)onClick:(UIButton *)sender;
- (IBAction)onSliderChanged:(UISlider *)sender;
- (void)saveDefault;

@end

@implementation HTMOptionViewController

//
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Viewが開く前に実行
- (void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *gameOption = [NSUserDefaults standardUserDefaults];
    _slider.value = [gameOption floatForKey:@"gameSpeed"];
    
}


// 画面初期化
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
    [self saveDefault];
}

- (void)saveDefault
{
    NSUserDefaults *gameOption = [NSUserDefaults standardUserDefaults];
    [gameOption setFloat:_slider.value forKey:@"gameSpeed"];
    [gameOption synchronize];
}

@end
