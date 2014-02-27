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
    _Tonbo.hidden = YES;
    _SuzumeBachi.hidden = YES;
    
    
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
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.7f
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

    // ゲームオーバーか判定
    if (_state.isGameOver)
    {
        _lblMsg.text = @"Game Over";
        _lblMsg.hidden = NO;
        _btnReTry.hidden = NO;
//        _btnReTry.enabled = YES;
        _state.time = [[NSDate date] timeIntervalSinceDate:_startDate];
        [_timer invalidate];
    }
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
            getBug(_lblMsg, _state, _Cho, _Hachi);
            break;
        }
        case 2:
            _state.haveHachi = YES;
            getBug(_lblMsg, _state, _Hachi, _Tento);
            break;
        case 3:
            _state.haveTento = YES;
            getBug(_lblMsg, _state, _Tento, _Tonbo);
            break;
        case 4:
            _state.haveTonbo = YES;
            getBug(_lblMsg, _state, _Tonbo, _SuzumeBachi);
            break;
        case 5:
            _state.haveSuzumeBachi = YES;
            getBug(_lblMsg, _state, _Tonbo, nil);
            break;
        default:
            break;
    }
}


//
- (IBAction)onReTryClick:(id)sender {
    [self initGame];
}


//
void getBug(UILabel *lblMsg, HTMGameState *state, UIImageView *currentBug, UIImageView *nextBug)
{
    lblMsg.text = @"捕まえた！";
    lblMsg.hidden = NO;

    [UIView animateWithDuration:0.2f // アニメーション速度
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

                         state.activeBug = nextBug;
                     }];
}

@end
