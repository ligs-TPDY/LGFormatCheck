//
//  NSDictionary+Safe.h
//  qfxtaoguwang
//
//  Created by apple on 2017/5/16.
//  Copyright © 2017年 qfx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)

- (id)objectSafeForKey:(id)aKey;

/**
 判断字典是否包含对应的Keys

 @param arrayForKeys 校验的Keys
 @return 结果
 */
- (BOOL)objectContainKeys:(NSArray *)arrayForKeys;

@end
