//
//  HTMParam.h
//  Mushitori
//
//  Created by あき on 2014/02/09.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMGameState : NSObject

// プロパティ
@property BOOL haveCho, haveHachi, haveTonbo, haveTento, haveSuzumeBachi;
@property NSTimeInterval time;
@property UIImageView *activeBug;


// 初期化（コンストラクタ）
- (id)init;

- (BOOL)isGameOver;

@end
