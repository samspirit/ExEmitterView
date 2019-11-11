//
//  ExButtonViewController.m
//  ExEmitterView_Example
//
//  Created by ecarx on 2019/11/11.
//  Copyright © 2019 11873288@qq.com. All rights reserved.
//

#import "ExButtonViewController.h"
#import "ExButtonViewModel.h"
#import "ExDefaultViewController.h"
#import "ExCustomViewController.h"

@interface ExButtonViewController ()
@property (nonatomic, strong) ExButtonViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *group;
@end

@implementation ExButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpGroup0];
}

- (void)setUpGroup0
{
    ExLabelItem *item0 = [ExLabelItem itemWithTitle:@"default"];
    item0.title = @"default";
    item0.descVc = [ExDefaultViewController class];
    
    ExLabelItem *item1 = [ExLabelItem itemWithTitle:@"custom"];
    item1.title = @"custom";
    item1.descVc = [ExCustomViewController class];
    
    ExLabelItem *item2 = [ExLabelItem itemWithTitle:@"component"];
    item2.title = @"component";
    
    
    ExGroupItem *group = [[ExGroupItem alloc] init];
    group.items = @[item0,item1,item2];
    group.headerTitle = @"下载按钮";
    [self.group addObject:group];
    self.viewModel.dataSource = [self.group copy];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(NSMutableArray *)group
{
    if (!_group) {
        _group = [NSMutableArray array];
    }
    return _group;
}
@end
