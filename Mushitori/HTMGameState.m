//
//  HTMParam.m
//  Mushitori
//
//  Created by Team HTML on 2014/02/09.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import "HTMGameState.h"


@implementation HTMGameState


// プロパティ（アクセサ定義）
@synthesize haveCho, haveHachi, haveTonbo, haveTento, haveSuzumeBachi;
@synthesize time, frameRate;
@synthesize activeBug;



// 初期化（コンストラクタ）
- (id) init
{
    if (self = [super init]) {
        haveCho = NO;
        haveHachi = NO;
        haveTonbo = NO;
        haveTento = NO;
        haveSuzumeBachi = NO;
        time = 0;
        frameRate = 1.0f;
    }
    
    return self;
}

// ゲームオーバー判定
- (BOOL) isGameOver
{
    if (activeBug == nil)
        return YES;
    else
        return NO;
}

@end
