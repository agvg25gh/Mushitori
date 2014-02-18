//
//  HTMGameViewController.m
//  Mushitori
//
//  Created by あき on 14/02/08.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import "HTMGameViewController.h"
#import "HTMKagoViewController.h"
#import "HTMGameState.h"


@implementation HTMGameViewController

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

    // ゲーム初期化
    [self initGame];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                   target:self
                                                 selector:@selector(procMove:)
                                                 userInfo:nil repeats:YES];

}


// ゲームの初期化
-(void)initGame
{
    LOG_SIZE(self.view.frame.size);

    // 画面の初期化
    _lblMsg.text = @"";
    _lblMsg.hidden = YES;
    _btnReTry.hidden = YES;
    _btnReTry.enabled = NO;
    
    _Cho.hidden = NO;
    _Hachi.hidden = YES;
    
    _activeBug = _Cho;

    
    // ゲームの状態管理クラスの初期化
    if (_state == nil)
        _state = [[HTMGameState alloc] init];
    else
        _state = [_state init];


    // ゲーム開始時刻の初期化
    _startDate = [NSDate date];
}


-(void)procMove:(NSTimer *)timer {
    UIScreen *screen = [UIScreen mainScreen];
    CGRect rect = screen.applicationFrame;
    
    //乱数によるX,Y座標設定
    int x = arc4random() % (int)rect.size.width;
    int y = arc4random() % ((int)rect.size.height - 100);
    CGPoint pos = CGPointMake(x, y);
    _activeBug.center = pos;

    LOG_POINT(_activeBug.center);
    
    _lblMsg.text = @"";
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
        kagoViewController.state = _state;
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
            _state.haveCho = YES;
            _lblMsg.text = @"捕獲した！";
            _Cho.hidden = YES;
            _Hachi.hidden = NO;
            _activeBug = _Hachi;
            break;
        case 2:
            _state.haveHachi = YES;
            _lblMsg.text = @"捕獲した！";
            _Hachi.hidden = YES;
            break;
        default:
            break;
    }

    // ゲームオーバーか判定
    if (_state.isGameOver)
    {
        _lblMsg.text = @"Game Over";
        _btnReTry.hidden = NO;
        _btnReTry.enabled = YES;
        _state.time = [[NSDate date] timeIntervalSinceDate:_startDate];
    }
    
    _lblMsg.hidden = NO;
}


- (IBAction)onReTryClick:(id)sender {
    LOG(@"初期化してリトライ");
    [self initGame];
}

@end
