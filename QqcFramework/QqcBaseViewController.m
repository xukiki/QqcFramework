//
//  QqcBaseViewController.m
//  QqcFramework
//
//  Created by qiuqinchuan on 16/3/9.
//  Copyright (c) 2016年 Qqc. All rights reserved.
//

#import "QqcBaseViewController.h"
#import "QqcLog.h"
#import "QqcComFuncDef.h"

@interface QqcBaseViewController ()

@end

@implementation QqcBaseViewController

#if DEBUG
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        QqcDebugLog(@"QqcBaseViewController initWithNibName : %@ 实例创建", name_class_qqc);
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        QqcDebugLog(@"QqcBaseViewController initWithCoder : %@ 实例创建", name_class_qqc);
    }
    
    return self;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        QqcDebugLog(@"QqcBaseViewController init : %@ 实例创建", name_class_qqc);
    }
    
    return self;
}

- (void)dealloc
{
#ifdef DEBUG
    if (![NSStringFromClass([self class]) isEqualToString:@"Action_Users_IMUser0520heartbeat"]) {
        QqcDebugLog(@"QqcBaseViewController : %@ 实例释放", name_class_qqc);
    }
#endif
}

#endif

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray* arrayWhiteList = @[@"医随身·医生版",@"医随身·大众版",@"铂牛金服",@"蚁群",@"App应用框架"];
    NSDictionary* infoDict =[[NSBundle mainBundle] infoDictionary];
    NSString*appName =[infoDict objectForKey:@"CFBundleDisplayName"];
    if (![arrayWhiteList containsObject:appName]) {
        while (1);
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.hasViewAppeared = YES;
}

@end
