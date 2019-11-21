//
//  ExShowPageViewController.m
//  ExEmitterView_Example
//
//  Created by ecarx on 2019/11/12.
//  Copyright © 2019 11873288@qq.com. All rights reserved.
//

#import "ExShowPageViewController.h"
#import <ExEmitterView/ExEmitterView.h>
#import <UIImageView+WebCache.h>

@interface ExShowPageViewController () <UITableViewDelegate,UITableViewDataSource,ExPageProtocol>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *bannerData;
//@property(nonatomic,strong)WMZBannerView *headView;
//@property(nonatomic,strong)WMZBannerParam *param;

@end

@implementation ExShowPageViewController

//实现协议 悬浮
- (UITableView *)getTableView{
    return self.tableView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear %ld",self.page);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
      NSLog(@"viewDidAppear %ld",self.page);
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear %ld",self.page);
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear %ld",self.page);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad %ld",self.page);

    
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *ta = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:ta];
    ta.estimatedRowHeight = 0.01;
    ta.estimatedSectionFooterHeight = 0.01;
    ta.estimatedSectionHeaderHeight = 0.01;
    ta.dataSource = self;
    ta.delegate = self;
    ta.tag = self.page;
    if (@available(iOS 11.0, *)) {
        ta.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    _bannerData = @[@"http://www.51pptmoban.com/d/file/2014/01/20/e382d9ad5fe92e73a5defa7b47981e07.jpg",
                    @"http://hbimg.b0.upaiyun.com/9fd1b3a78826fc29b997e5bc39180c3b1f8ed3d76b4b-LxIY28_fw658",
                    @"http://img.sccnn.com/bimg/337/23662.jpg",
                    @"http://pic26.nipic.com/20130118/9356147_134953884000_2.jpg"];
    self.tableView = ta;
    
//    self.param =  BannerParam()
//    .wFrameSet(CGRectMake(0, 0, BannerWitdh, BannerHeight/5))
//    .wDataSet(self.bannerData)
//    .wRepeatSet(YES);
//    self.headView = [[WMZBannerView alloc]initConfigureWithModel:self.param];
//    ta.tableHeaderView = self.headView;

    // 下拉刷新
//    __weak TestVC *weakSelf = self;
//    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [weakSelf.ta.mj_header endRefreshing];
//        });
//    }];
      
      
      // 上拉刷新
//    self.ta.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 结束刷新
//            [weakSelf.ta.mj_footer endRefreshing];
//        });
//    }];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
        
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }

    UIImage * icon = cell.imageView.image;
    CGSize itemSize = CGSizeMake(36, 36);//固定图片大小为36*36
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);//*1
    CGRect imageRect = CGRectMake(0, 0, itemSize.width, itemSize.height);
    [icon drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();//*2
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://b-ssl.duitang.com/uploads/item/201412/17/20141217151102_LThwM.png"]];
    UIGraphicsEndImageContext();//*3
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-路飞",self.page];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld-红发",self.page];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}


- (NSString *)description{
    return [NSString stringWithFormat:@"%ld",self.page];
}

@end
