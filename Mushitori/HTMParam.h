//
//  HTMParam.h
//  Mushitori
//
//  Created by あき on 2014/02/09.
//  Copyright (c) 2014年 Team HTML. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMParam : NSObject {
    bool    cho;
    bool    hachi;
    bool    tonbo;
    bool    tento;
    bool    suzume;
    
    NSString *gameTime;
}

@property bool cho, hachi, tonbo, tento, suzume;
@property NSString *gameTime;

@end
