//
//  jsonFormatCheck.m
//  LGformatCheck
//
//  Created by carnet on 2018/12/27.
//  Copyright © 2018年 TP. All rights reserved.
//

#import "jsonFormatCheck.h"
#import "NSDictionary+Safe.h"
@implementation jsonFormatCheck
#pragma mark - --校验出参格式是否与模版相同--
+ (BOOL)matchJsonFormatWithStencil:(id)stencilJson check:(id)checkJson
{
    return [self comparingEachLayer:stencilJson :checkJson];
}
////逐层校验
+ (BOOL)comparingEachLayer:(id)layer1 :(id)layer2
{
    if ([layer1 isKindOfClass:[layer2 superclass]]) {
        if ([layer1 isKindOfClass:[NSObject class]]) {///判断是否为OC对象
            if ([layer1 isKindOfClass:[NSDictionary class]]) {///字典类型
                return  [self comparingDic:layer1 :layer2];//比较字典
            }else if ([layer1 isKindOfClass:[NSArray class]]) {///数组类型
                return  [self comparingArrayValues:layer1 :layer2];//比较数组
            }else{return YES;}//其他类型不用做进一步校验
        }else{return YES;}//基本数据类型不用做进一步校验
    }else{NSLog(@"数据类型不相同");return NO;}
}
///校验字典
+ (BOOL)comparingDic:(NSDictionary *)dic1 :(NSDictionary *)dic2
{
    NSArray *keys = [dic1 allKeys];
    NSArray *keys2 =[dic2 allKeys];
    if ([self comparingDicKey:keys :keys2]) {
        if ([dic2 objectContainKeys:keys2]) {//校验字典每个key的值不为空
            return [self comparingDicValues:dic1 :dic2];
        }else{NSLog(@"字典的key值存在空");return NO;}
    }else{NSLog(@"字典的key比较不相同");return NO;}
}
///校验字典的key
+ (BOOL)comparingDicKey:(NSArray *)arr1 :(NSArray *)arr2
{
    if ([self comparingCountArray:arr1 :arr2]) {
        for (int i=0;i<arr1.count;i++) {
            NSString *key = arr1[i];
            for (int j=0;j<arr2.count;j++) {
                NSString *key2 = arr2[j];
                if ([key isEqualToString:key2]) {
                    break;
                }
                if (j == arr2.count-1) {
                    return NO;
                }
            }
        }
        return YES;
    }else{;return NO;}
}
//校验字典的values
+ (BOOL)comparingDicValues:(NSDictionary *)dic1 :(NSDictionary *)dic2
{
    for (int i=0; i<dic1.allKeys.count; i++) {
        NSString *key = dic1.allKeys[i];
        id value1 = [dic1 objectSafeForKey:key];
        id value2 = [dic2 objectSafeForKey:key];
        [NSClassFromString(@"NSTaggedPointerString") superclass];
        if (![self comparingEachLayer:value1 :value2]) {NSLog(@"字典的values校验失败");return NO;};
    }
    return YES;
}
///校验数组
+ (BOOL)comparingArrayValues:(NSArray *)array1 :(NSArray *)array2
{
    if ([self comparingCountArray:array1 :array2]) {
        if ([self comparingArray:array1 :array2]) {
            for (int i=0; i<array2.count; i++) {
                id value1 = array1[i];
                id value2 = array2[i];
                if (![self comparingEachLayer:value1 :value2]) {NSLog(@"数组的值校验失败");return NO;}
            }
            return YES;
        }else{return NO;}///数组元素不相同
    }else{return NO;}///数组长度不相同
}
///校验数组类型
+ (BOOL)comparingArray:(NSArray *)array1 :(NSArray *)array2
{
    if ([array1 isEqualToArray:array2]) {
        return YES;
    }else{NSLog(@"数组类型不相同");return NO;};
}
///校验数组长度
+ (BOOL)comparingCountArray:(NSArray *)array1 :(NSArray *)array2
{
    if (array1.count == array2.count) {
        return YES;
    }else{NSLog(@"数组长度不相同");return NO;};
}
@end
