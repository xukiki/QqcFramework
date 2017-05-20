//
//  QqcFetchViewController.m
//  QqcFramework
//
//  Created by qiuqinchuan on 16/3/9.
//  Copyright (c) 2016年 Qqc. All rights reserved.
//

#import "QqcFetchViewController.h"
#import "QqcBaseActionProcessor.h"

@interface QqcFetchViewController ()

@end

@implementation QqcFetchViewController

#pragma mark - 接口
- (void)startWithCompletionBlockWithClass:(Class)actionProcessorClass
                                    param:(QqcParamModel *)param
                                  success:(void (^)(QqcBaseActionProcessor *actionProcessor))successBlock
                                     fail:(void (^)(QqcBaseActionProcessor *actionProcessor))failBlock;
{
    QqcBaseActionProcessor *actionProcessor = [[actionProcessorClass alloc] initWithParam:param postFileParam:nil];
    [actionProcessor startWithCompletionBlockWithSuccess:^(QqcBaseActionProcessor *actionProcessor) {
        if (successBlock) {
            successBlock(actionProcessor);
        }
    } fail:^(QqcBaseActionProcessor *actionProcessor) {
        if (failBlock) {
            failBlock(actionProcessor);
        }
    }];
}

@end
