//
//  HTMParam.h
//  Mushitori
//
//  Created by あき on 2014/02/09.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMParam : NSObject {
//    BOOL cho, hachi, tonbo, tento, suzume;
//    NSString *gameTime;
}

// プロパティ
@property BOOL cho, hachi, tonbo, tento, suzume;
@property (retain) NSString *gameTime;

// 初期化メソッド（コンストラクタ）
- (id)init;

@end
