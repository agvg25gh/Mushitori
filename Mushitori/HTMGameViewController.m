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

//    NSTimer *tm = [NSTimer scheduledTimerWithTimeInterval:1.5f
//                                                   target:self
//                                                 selector:@selector(hoge:)
//                                                 userInfo:nil repeats:YES];

    // ゲーム初期化
    [self initGame];
}


// ゲーム設定の初期化
-(void)initGame
{
    if (_param == nil)
        _param = [[HTMParam alloc] init];
    else
        _param = [_param init];
    
    _lblMsg.text = @"";
    _lblMsg.hidden = YES;
    _btnReTry.hidden = YES;
    _btnReTry.enabled = NO;
    
    _Cho.hidden = NO;
    _Hachi.hidden = NO;
}


-(void)hoge:(NSTimer *)timer {
    NSLog(@"ここで虫用のImageViewの位置を動かす");
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


// 蝶捕獲イベント
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _lblMsg.hidden = YES;
    _lblMsg.text = @"";
    
    UITouch *touch = [[event allTouches] anyObject];
    switch (touch.view.tag) {
        case 1:
            _param.cho = YES;
            _lblMsg.text = @"捕獲した！";
            _Cho.hidden = YES;
            break;
        case 2:
            _param.hachi = YES;
            _lblMsg.text = @"捕獲した！";
            _Hachi.hidden = YES;
            break;
        default:
            break;
    }

    // ゲームオーバーか判定
    if (_param.isGameOver)
    {
        _lblMsg.text = @"Game Over";
        _btnReTry.hidden = NO;
        _btnReTry.enabled = YES;
    }
    
    _lblMsg.hidden = NO;
    
    NSLog(@"Cho : %d", _param.cho);
    NSLog(@"Hachi : %d", _param.hachi);
    NSLog(@"Time : %@", _param.gameTime);
}


- (IBAction)onReTryClick:(id)sender {
    NSLog(@"初期化してリトライ");
    [self initGame];
}

@end
