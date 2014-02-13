//
//  HTMParam.m
//  Mushitori
//
//  Created by あき on 2014/02/09.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import "HTMParam.h"


@implementation HTMParam

// プロパティ（アクセサ定義）
@synthesize cho, hachi, tonbo, tento, suzume;
@synthesize gameTime;

// 初期化（コンストラクタ）
- (id) init
{
    if (self = [super init]) {
        cho = NO;
        hachi = NO;
        tonbo = NO;
        tento = NO;
        suzume = NO;
        gameTime = @"";
    }
    return self;
}

// ゲームオーバー判定メソッド
- (BOOL) isGameOver
{
    if (cho && hachi)
        return YES;
    else
        return NO;
}

@end
