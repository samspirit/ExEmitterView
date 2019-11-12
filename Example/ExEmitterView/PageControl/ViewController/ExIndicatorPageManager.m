//
//  ExIndicatorPageViewController.m
//  ExEmitterView_Example
//
//  Created by ecarx on 2019/11/12.
//  Copyright © 2019 11873288@qq.com. All rights reserved.
//

#import "ExIndicatorPageManager.h"

@implementation ExIndicatorPageManager

-(void)pushWithViewController:(UIViewController *)viewController withIndex:(NSInteger)index
{
    //动画
    NSDictionary *animal = @{
          @(0):@(PageTitleMenuNone),
          @(1):@(PageTitleMenuLine),
          @(2):@(PageTitleMenuAiQY),
          @(3):@(PageTitleMenuTouTiao),
          @(4):@(PageTitleMenuYouKu),
          @(5):@(PageTitleMenuCircle),
      };
    
    NSArray *data = [self textData];
    NSMutableArray *vcArr = [NSMutableArray new];
    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ExShowPageViewController *vc = [ExShowPageViewController new];
        vc.page = idx;
        [vcArr addObject:vc];
    }];
    
    ExPageParam *param = PageParam()
    .wTitleArrSet(data)
    .wControllersSet(vcArr)
    .wMenuAnimalSet([animal[@(index)] intValue]);
    ExPageController *VC =  [ExPageController new];
    VC.param = param;
    [viewController.navigationController pushViewController:VC animated:YES];
}

//普通标题
- (NSArray*)textData{
    return @[@"推荐",@"LOOK直播",@"画",@"现场",@"翻唱",@"MV",@"广场",@"游戏"];
}
@end
