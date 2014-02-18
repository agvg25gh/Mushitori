//
//  HTMParam.m
//  Mushitori
//
//  Created by あき on 2014/02/09.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import "HTMGameState.h"


@implementation HTMGameState

// プロパティ（アクセサ定義）
@synthesize haveCho, haveHachi, haveTonbo, haveTento, haveSuzumeHachi;
@synthesize time;

// 初期化（コンストラクタ）
- (id) init
{
    if (self = [super init]) {
        haveCho = NO;
        haveHachi = NO;
        haveTonbo = NO;
        haveTento = NO;
        haveSuzumeHachi = NO;
        time = 0;
    }
    return self;
}

// ゲームオーバー判定
- (BOOL) isGameOver
{
    if (haveCho && haveHachi)
        return YES;
    else
        return NO;
}

@end
