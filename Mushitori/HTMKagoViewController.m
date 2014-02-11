//
//  HTMKagoViewController.m
//  Mushitori
//
//  Created by あき on 14/02/08.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import "HTMKagoViewController.h"
#import "HTMParam.h"


@implementation HTMKagoViewController

@synthesize param;

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
    
    NSLog(@"蝶フラグ：%d", self.param.cho);
    NSLog(@"蜂フラグ：%d", self.param.hachi);
    NSLog(@"トンボフラグ：%d", self.param.tonbo);
    NSLog(@"テントウフラグ：%d", self.param.tento);
    NSLog(@"スズメ蜂フラグ：%d", self.param.suzume);
    NSLog(@"タイム：%@", self.param.gameTime);
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
