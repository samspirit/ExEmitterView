//
//  ExLongPressViewController.m
//  ExEmitterView_Example
//
//  Created by ecarx on 2019/11/28.
//  Copyright © 2019 11873288@qq.com. All rights reserved.
//

#import "ExLongPressViewController.h"
#import <ExEmitterView/ExEmitterView.h>

@interface ExLongPressViewController ()

@end

@implementation ExLongPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 250, 300, 100)];
    [titleLabel setFont:[UIFont systemFontOfSize:22]];
    titleLabel.numberOfLines = 0;
    [titleLabel setText:@"操作"];
    [titleLabel setTextColor:[UIColor redColor]];
    [self.view addSubview:titleLabel];
    
    
    ExLongPressButton *longPressBtn = [[ExLongPressButton alloc] initWithFrame:CGRectMake(150, 250, 50, 50)];
    [longPressBtn setTopColor:[UIColor whiteColor]];
    [longPressBtn setProgressColor:[UIColor redColor]];
    [self.view addSubview:longPressBtn];

    longPressBtn.tapCompleteHandler = ^{
        NSLog(@"点击");
        [titleLabel setText:@"点击"];
    };
    longPressBtn.startLongPressCompleteHandler = ^{
        NSLog(@"开始长按");
        [titleLabel setText:@"开始长按"];
    };
    longPressBtn.endLongPressCompleteHandler = ^(float longPressTime) {
        NSLog(@"结束长按");
        [titleLabel setText:[NSString stringWithFormat:@"结束长按，长按时间:%f",longPressTime]];
    };
    longPressBtn.cancelLongPressCompleteHandler = ^{
        NSLog(@"取消长按");
    };
}

-(void)dealloc
{
    NSLog(@"%s",__func__);
}
@end
