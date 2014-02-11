//
//  HTMParam.m
//  Mushitori
//
//  Created by あき on 2014/02/09.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import "HTMParam.h"


@implementation HTMParam

// getter/setter定義
@synthesize cho, hachi, tonbo, tento, suzume;
@synthesize gameTime;

// 初期化メソッド定義
- (id) init
{
    if (self = [super init]) {
        self.cho = NO;
        self.hachi = NO;
        self.tonbo = NO;
        self.tento = NO;
        self.suzume = NO;
        self.gameTime = @"";
    }
    return self;
}

@end
