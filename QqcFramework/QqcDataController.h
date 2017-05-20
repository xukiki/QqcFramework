//
//  QqcDataController.h
//  QqcFramework
//
//  Created by admin on 16/3/14.
//  Copyright © 2016年 Qqc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QqcParamModel.h"
#import "QqcBaseActionProcessor.h"

@interface QqcDataController : NSObject

/**
 *  封装网络请求方法（显示菊花，不带提示）
 *
 *  @param actionProcessorClass 具体的网络请求类
 *  @param param      传递的参数
 *  @param successBlock    成功回调
 *  @param failBlock    失败回调
 */
- (void)startWithCompletionBlockWithClass:(Class)actionProcessorClass
                                    param:(QqcParamModel *)param
                            postFileParam:(QqcParamPostFile* )postFileParam
                                  success:(void (^)(QqcBaseActionProcessor *actionProcessor))successBlock
                                     fail:(void (^)(QqcBaseActionProcessor *actionProcessor))failBlock;

/**
 *  封装网络请求方法(不显示菊花，不带提示)
 *
 *  @param actionProcessorClass 具体的网络请求类
 *  @param param      传递的参数
 *  @param successBlock    成功回调
 *  @param failBlock    失败回调
 */
- (void)startSilentWithCompletionBlockWithClass:(Class)actionProcessorClass
                                    param:(QqcParamModel *)param
                            postFileParam:(QqcParamPostFile* )postFileParam
                                  success:(void (^)(QqcBaseActionProcessor *actionProcessor))successBlock
                                     fail:(void (^)(QqcBaseActionProcessor *actionProcessor))failBlock;


/**
 *  封装网络请求方法(显示菊花，带成功失败提示)
 *
 *  @param actionProcessorClass 具体的网络请求类
 *  @param param      传递的参数
 *  @param successBlock    成功回调
 *  @param failBlock    失败回调
 */
- (void)startTipWithCompletionBlockWithClass:(Class)actionProcessorClass
                                          param:(QqcParamModel *)param
                                  postFileParam:(QqcParamPostFile* )postFileParam
                                        success:(void (^)(QqcBaseActionProcessor *actionProcessor))successBlock
                                           fail:(void (^)(QqcBaseActionProcessor *actionProcessor))failBlock;

@end
