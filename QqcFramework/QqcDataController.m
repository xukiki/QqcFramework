//
//  QqcDataController.m
//  QqcFramework
//
//  Created by admin on 16/3/14.
//  Copyright © 2016年 Qqc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QqcDataController.h"


#import "QqcProgressHUD.h"
#import "QqcUtilityUI.h"
#import "QqcLog.h"
#import "QqcError.h"
#import "QqcProgressHUD+Qqc.h"

@implementation QqcDataController

#pragma mark - 接口
- (void)startWithCompletionBlockWithClass:(Class)actionProcessorClass
                                    param:(QqcParamModel *)param
                            postFileParam:(QqcParamPostFile* )postFileParam
                                  success:(void (^)(QqcBaseActionProcessor *actionProcessor))successBlock
                                     fail:(void (^)(QqcBaseActionProcessor *actionProcessor))failBlock;
{
    QqcBaseActionProcessor *actionProcessor = [[actionProcessorClass alloc] initWithParam:param postFileParam:postFileParam];
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    [QqcProgressHUD showHUDAddedTo:[QqcUtilityUI getCurrentVC].view animated:YES];
    
    [actionProcessor startWithCompletionBlockWithSuccess:^(QqcBaseActionProcessor *actionProcessor) {
        
        [QqcProgressHUD hideHUDForView:[QqcUtilityUI getCurrentVC].view animated:YES];
        
        if (successBlock) {
            successBlock(actionProcessor);
        }
    } fail:^(QqcBaseActionProcessor *actionProcessor) {
        
        [QqcProgressHUD hideHUDForView:[QqcUtilityUI getCurrentVC].view animated:YES];
        
        if (failBlock) {
            failBlock(actionProcessor);
            
            QqcWarnLog(@"请求失败：%@ \n ActionClass=%@", actionProcessor.error.localizedDescription, NSStringFromClass(actionProcessorClass));
        }
    }];
}

- (void)startSilentWithCompletionBlockWithClass:(Class)actionProcessorClass
                                          param:(QqcParamModel *)param
                                  postFileParam:(QqcParamPostFile* )postFileParam
                                        success:(void (^)(QqcBaseActionProcessor *actionProcessor))successBlock
                                           fail:(void (^)(QqcBaseActionProcessor *actionProcessor))failBlock
{
    QqcBaseActionProcessor *actionProcessor = [[actionProcessorClass alloc] initWithParam:param postFileParam:postFileParam];
    
    [actionProcessor startWithCompletionBlockWithSuccess:^(QqcBaseActionProcessor *actionProcessor) {
        
        if (successBlock) {
            successBlock(actionProcessor);
        }
    } fail:^(QqcBaseActionProcessor *actionProcessor) {
        if (failBlock) {
            failBlock(actionProcessor);
            
            QqcWarnLog(@"请求失败：%@ \n ActionClass=%@", actionProcessor.error.localizedDescription, NSStringFromClass(actionProcessorClass));
        }
    }];
}


- (void)startTipWithCompletionBlockWithClass:(Class)actionProcessorClass
                                       param:(QqcParamModel *)param
                               postFileParam:(QqcParamPostFile* )postFileParam
                                     success:(void (^)(QqcBaseActionProcessor *actionProcessor))successBlock
                                        fail:(void (^)(QqcBaseActionProcessor *actionProcessor))failBlock
{
    QqcBaseActionProcessor *actionProcessor = [[actionProcessorClass alloc] initWithParam:param postFileParam:postFileParam];
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    [QqcProgressHUD showHUDAddedTo:[QqcUtilityUI getCurrentVC].view animated:YES];
    
    [actionProcessor startWithCompletionBlockWithSuccess:^(QqcBaseActionProcessor *actionProcessor) {
        
        if (successBlock) {
            
            [QqcProgressHUD showTextOnly:actionProcessor.successString toView:[QqcUtilityUI getCurrentVC].view];
            
            successBlock(actionProcessor);
        }
    } fail:^(QqcBaseActionProcessor *actionProcessor) {
        if (failBlock) {
            
            [QqcProgressHUD showTextOnly:actionProcessor.error.localizedDescription toView:[QqcUtilityUI getCurrentVC].view];
            
            failBlock(actionProcessor);
        }
    }];
}



@end
