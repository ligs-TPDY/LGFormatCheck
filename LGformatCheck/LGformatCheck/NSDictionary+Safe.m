//
//  NSDictionary+Safe.m
//  qfxtaoguwang
//
//  Created by apple on 2017/5/16.
//  Copyright © 2017年 qfx. All rights reserved.
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)

- (id)objectSafeForKey:(id)aKey
{
    if ([self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    if ([[self objectForKey:aKey] isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    id obj = [self objectForKey:aKey];
    
    return obj;
}

- (BOOL)objectContainKeys:(NSArray *)arrayForKeys
{
    int count = 0;
    for (NSString *key in self.allKeys) {
        for (NSString *key2 in arrayForKeys) {
            if ([key isEqualToString:key2] && [self objectSafeForKey:key2]) {
                count ++;
                break;
            }
        }
    }
    if (count == arrayForKeys.count) {
        return YES;
    }else{
        return NO;
    }
}

@end
