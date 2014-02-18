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
	// Do any additional setup after loading the view.
    
    LOG(@"蝶フラグ：%d", self.state.haveCho);
    LOG(@"蜂フラグ：%d", self.state.haveHachi);
    LOG(@"トンボフラグ：%d", self.state.haveTonbo);
    LOG(@"テントウフラグ：%d", self.state.haveTento);
    LOG(@"スズメ蜂フラグ：%d", self.state.haveSuzumeHachi);
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
