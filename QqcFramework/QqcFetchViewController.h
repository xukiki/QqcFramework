//
//  QqcFetchViewController.h
//  QqcFramework
//
//  Created by qiuqinchuan on 16/3/9.
//  Copyright (c) 2016年 Qqc. All rights reserved.
//

#import "QqcBaseViewController.h"

@class QqcBaseActionProcessor;
@class QqcParamModel;

/**
 *  封装网络控制器
 */
@interface QqcFetchViewController : QqcBaseViewController

/**
 *  封装网络请求方法
 *
 *  @param actionProcessorClass 具体的网络请求类
 *  @param param      传递的参数
 *  @param successBlock    成功回调
 *  @param failBlock    失败回调
 */
- (void)startWithCompletionBlockWithClass:(Class)actionProcessorClass
                                    param:(QqcParamModel *)param
                                  success:(void (^)(QqcBaseActionProcessor *actionProcessor))successBlock
                                     fail:(void (^)(QqcBaseActionProcessor *actionProcessor))failBlock;

@end
