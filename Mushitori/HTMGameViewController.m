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
}


// ゲームの初期化
-(void)initGame
{
    LOG_SIZE(self.view.frame.size);

    // 画面の初期化
    _lblMsg.text = @"捕まえた！";
    _lblMsg.hidden = YES;
    _btnReTry.hidden = YES;
    
    _Cho.hidden = YES;
    _Hachi.hidden = YES;
    _Tento.hidden = YES;
    _Suzume.hidden = YES;
    
    
    // ゲームの状態管理クラスの初期化
    if (_state == nil)
        _state = [[HTMGameState alloc] init];
    else
        _state = [_state init];


    // ゲーム開始時刻の初期化
    _startDate = [NSDate date];

    // アクティブなキャラセット
    _state.activeBug = _Cho;
    _state.activeBug.hidden = NO;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                              target:self
                                            selector:@selector(procMove:)
                                            userInfo:nil repeats:YES];
}


-(void)procMove:(NSTimer *)timer {
    UIScreen *screen = [UIScreen mainScreen];
    CGRect rect = screen.applicationFrame;
    
    //乱数によるX,Y座標設定
    int x = arc4random() % (int)rect.size.width;
    int y = arc4random() % ((int)rect.size.height - 100);
    CGPoint pos = CGPointMake(x, y);
    _state.activeBug.center = pos;

    LOG_POINT(_state.activeBug.center);
    
    _lblMsg.hidden = YES;
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


// イベント
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    UITouch *touch = [[event allTouches] anyObject];
    switch (touch.view.tag) {
        case 1:
        {
            _state.haveCho = YES;
            getBug(_lblMsg, _Hachi, _state, _Cho);
            _state.activeBug = _Hachi;
            break;
        }
        case 2:
            _state.haveHachi = YES;
            getBug(_lblMsg, _Tento, _state, _Hachi);
            _state.activeBug = _Tento;
            break;
        case 3:
            _state.haveTento = YES;
            getBug(_lblMsg, _Suzume, _state, _Tento);
            _state.activeBug = _Suzume;
            break;
        case 4:
            _state.haveSuzumeHachi = YES;
            getBug(_lblMsg, nil, _state, _Suzume);
            _state.activeBug = nil;
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
        [_timer invalidate];
    }
}


//
- (IBAction)onReTryClick:(id)sender {
    [self initGame];
}


//
void getBug(UILabel *lblMsg, UIImageView *nextBug, HTMGameState *state, UIImageView *currentBug)
{
    lblMsg.hidden = NO;
    [UIView animateWithDuration:0.2f // アニメーション速度1秒
                          delay:0.0 // すぐアニメ開始
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         state.activeBug.transform = CGAffineTransformIdentity;
                         state.activeBug.transform = CGAffineTransformMakeRotation(M_PI);
                         state.activeBug.transform = CGAffineTransformMakeRotation(M_PI);
                     } completion:^(BOOL finished) {
                         // アニメーション終了時
                         currentBug.hidden = YES;
                         
                         if (nextBug != nil)
                             nextBug.hidden = NO;
                         
                     }];
}

@end
