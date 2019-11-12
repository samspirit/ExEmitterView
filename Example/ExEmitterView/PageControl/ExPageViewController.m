//
//  ExPageViewController.m
//  ExEmitterView_Example
//
//  Created by ecarx on 2019/11/12.
//  Copyright © 2019 11873288@qq.com. All rights reserved.
//

//状态栏高度
#define PageVCStatusBarHeight (PageVCIS_iPhoneX ? 44.f : 20.f)
//导航栏高度
#define PageVCNavBarHeight (44.f+PageVCStatusBarHeight)
//底部标签栏高度
#define PageVCTabBarHeight (PageVCIS_iPhoneX ? (49.f+34.f) : 49.f)

#import "ExPageViewController.h"
#import "ExPageBaseManager.h"
#import <ExEmitterView/ExEmitterView.h>

@interface ExPageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *taData;
@property(nonatomic,strong)NSArray *titleData;
@property(nonatomic,strong)NSArray *VCData;
@end

@implementation ExPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, PageVCNavBarHeight, self.view.frame.size.width,self.view.frame.size.height-PageVCNavBarHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    tableView.estimatedRowHeight = 0.01;
    tableView.estimatedSectionFooterHeight = 0.01;
    tableView.estimatedSectionHeaderHeight = 0.01;
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.taData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.titleData[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.taData[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.taData[indexPath.section][indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExPageBaseManager *vc = [NSClassFromString(self.VCData[indexPath.section]) new];
    [vc pushWithViewController:self withIndex:indexPath.row];
}

- (NSArray *)taData{
    if (!_taData) {
        _taData = @[
        @[@"链式语法展示所有属性"],
        @[@"普通标题",@"换行标题",@"带红点普通标题",@"富文本标题",@"图文标题(图上文下)",@"图文标题(图左文右),标题在底部",
          @"导航栏标题",@"居中标题",@"固定最右边标题",@"固定最右边图片+标题",@"固定宽度标题"],
        @[@"无样式",@"下划线不跟随移动",@"下划线跟随移动",@"字体变大",@"圆点+跟随滑动+颜色渐变",@"背景框"],
        @[@"爱奇艺",@"优酷",@"拼多多",@"今日头条",@"微博",@"京东",@"简书",@"悬浮效果",@"适配暗黑模式"],
        ];
    }
    return _taData;
}

- (NSArray *)titleData{
    if (!_titleData) {
        _titleData = @[@"完整手动管理控制器生命周期",@"标题样式",@"指示器样式",@"实际使用"];
    }
    return _titleData;
}

- (NSArray *)VCData{
    if (!_VCData) {
        _VCData = @[@"ExPropertiesPageManager",@"ExTitlePageManager",@"ExIndicatorPageManager",@"ExUserPageManager"];
    }
    return _VCData;
}
@end
