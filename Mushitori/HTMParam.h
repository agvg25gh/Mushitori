//
//  HTMParam.h
//  Mushitori
//
//  Created by あき on 2014/02/09.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMParam : NSObject

// プロパティ
@property BOOL cho, hachi, tonbo, tento, suzume;
@property (retain) NSString *gameTime;

// 初期化（コンストラクタ）
- (id)init;

- (BOOL)isGameOver;

@end
