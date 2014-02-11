//
//  HTMGameViewController.m
//  Mushitori
//
//  Created by あき on 14/02/08.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import "HTMGameViewController.h"
#import "HTMKagoViewController.h"
#import "HTMParam.h"


@implementation HTMGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    _param = [[HTMParam alloc] init];
    _param.cho = YES;
    _param.tonbo = YES;
    _param.gameTime = @"12:10:09";
    
    NSLog(@"cho : %d", _param.cho);
    NSLog(@"cho : %d", _param.tonbo);
    NSLog(@"cho : %@", _param.gameTime);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 画面遷移での引数渡し
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // 対象遷移のSegue取得
    if( [[segue identifier] isEqualToString:@"showKago"]) {
        HTMKagoViewController *kagoViewController = [segue destinationViewController];
        kagoViewController.param = _param;
    }
}

@end
