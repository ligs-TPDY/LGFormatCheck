//
//  ViewController.m
//  LGformatCheck
//
//  Created by carnet on 2018/12/27.
//  Copyright © 2018年 TP. All rights reserved.
//

#import "ViewController.h"
#import "jsonFormatCheck.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if ([jsonFormatCheck matchJsonFormatWithStencil:[self discoveryClassificationOutputParameter]
                                              check:[self discoveryClassificationOutputParameter2]]) {
        NSLog(@"格式相同");
    }else{
        NSLog(@"格式不同");
    }
}

- (NSDictionary *)discoveryClassificationOutputParameter
{
    NSDictionary *dicForStencil = @{@"data":@{@"HomePageClassification":@{@"content":@"123",
                                                                          @"id":@1,
                                                                          @"pageClass":@"1",
                                                                          @"platform":@"1",
                                                                          @"versionNumber":@""
                                                                          },
                                              
                                              },
                                    @"errCode":@1,
                                    @"errMsg":@"1234"
                                    };
    return dicForStencil;
}
- (NSDictionary *)discoveryClassificationOutputParameter2
{
    NSDictionary *dicForStencil = @{@"data":@{@"HomePageClassification":@{@"content":@"123",
                                                                          @"id":@1,
                                                                          @"pageClass":@"1",
                                                                          @"platform":@"1",
                                                                          @"versionNumber":@""
                                                                          },
                                              @"fsdfs":@"fdsafasdfas"},
                                    @"errCode":@1,
                                    @"errMsg":@"1234"
                                    };
    return dicForStencil;
}

- (NSDictionary *)recommendClassificationOutputParameter
{
    NSDictionary *dicForStencil = @{@"columnName":@"1",
                                    @"consultantIconImageUrl":@"2",
                                    @"consultantIntroduction":@"3",
                                    @"consultantName":@"4",
                                    @"consultingID":@(0),
                                    @"industry":@"",
                                    @"involvedBlock":@"",
                                    @"isAttent":@(0),
                                    @"lableType":@(0),
                                    @"marketCode":@"",
                                    @"newsAuthor":@"",
                                    @"newsId":@(4731515),
                                    @"newsImage":@[@{@"id":@"",
                                                     @"imageUrl":@"https://file.tgw360.com/file-service/src/image/tgw/news/images/888/97ee76419ab0498d9ae545a528914f6e.jpg",
                                                     @"newsSourceID":@""}],
                                    @"newsLabel":@"222",
                                    @"newsStock":@"SH601016",
                                    @"newsTitle":@"EEEE",
                                    @"newsType":@(0),
                                    @"publishTime":@"2018-07-23 22:20:29",
                                    @"readStatus":@(0),
                                    @"source":@"123"};
    return dicForStencil;
}

@end
