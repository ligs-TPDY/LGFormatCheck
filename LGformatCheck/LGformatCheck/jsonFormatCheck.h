//
//  jsonFormatCheck.h
//  LGformatCheck
//
//  Created by carnet on 2018/12/27.
//  Copyright © 2018年 TP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface jsonFormatCheck : NSObject
+ (BOOL)matchJsonFormatWithStencil:(id)stencilJson check:(id)checkJson;
@end

NS_ASSUME_NONNULL_END
