//
//  HTMViewController.m
//  Mushitori
//
//  Created by あき on 14/02/08.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import "HTMStartViewController.h"


@implementation HTMStartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 蝶のアニメーションのオプション
    UIViewAnimationOptions animeOptions =
    UIViewAnimationOptionCurveEaseInOut // イーズインアウト
    | UIViewAnimationOptionAutoreverse // 自動逆再生
    | UIViewAnimationOptionRepeat ; // 繰り返し
    // 蝶のアニメーションの開始
    [UIView animateWithDuration:1.5 // アニメの秒数
                          delay:0.0 // 開始待ち秒数
                        options:animeOptions
                     animations:^{
                         // 2倍サイズになる
                         _cyo.transform = CGAffineTransformMakeScale(0.5, 0.5);
                         // π/4回転する
                         _cyo.transform = CGAffineTransformMakeRotation(M_PI_2);
                     }
                     completion:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    // 座標はviewDidAppear以降でなければ取得できない
    CGFloat cx = _kaeru.center.x;
    CGFloat cy = _kaeru.center.y;
    // アニメーションのオプション
    UIViewAnimationOptions animeOptions =
    UIViewAnimationOptionCurveEaseInOut // イーズインアウト
    | UIViewAnimationOptionAutoreverse // 自動逆再生
    | UIViewAnimationOptionRepeat ; // 繰り返し
    // アニメーションの開始
    [UIView animateWithDuration:1.0 // アニメの秒数
                          delay:0.0 // 開始待ち秒数
                        options:animeOptions
                     animations:^{
                         _kaeru.center = CGPointMake(cx, cy-50); // 上下運動
                     }
                     completion:nil];
}

@end
