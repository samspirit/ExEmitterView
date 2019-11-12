//
//  EXViewController.m
//  ExEmitterView
//
//  Created by Geely on 11/11/2019.
//  Copyright (c) 2019 samspirit. All rights reserved.
//

#import "ExMainTableViewController.h"
#import "ExMainTableViewModel.h"

#import "ExButtonViewController.h"
#import "ExButtonViewModel.h"

#import "ExPageViewController.h"

@interface ExMainTableViewController ()
@property (nonatomic, strong) ExMainTableViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *group;
@end

@implementation ExMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpGroup0];
}

- (void)setUpGroup0
{
    ExLabelItem *item0 = [ExLabelItem itemWithTitle:@"Button"];
    item0.title = @"按钮集合";
    item0.option = ^(ExBaseRowItem * _Nonnull item) {
        ExButtonViewController *buttonVC = [[ExButtonViewController alloc] initWithViewModel:[ExButtonViewModel new]];
        [self.navigationController pushViewController:buttonVC animated:YES];
    };
    
    ExLabelItem *item1 = [ExLabelItem itemWithTitle:@"Page Control"];
    item1.title = @"Page Control";
    item1.descVc = [ExPageViewController class];
    
    ExLabelItem *item2 = [ExLabelItem itemWithTitle:@"通用0"];
    item2.title = @"通用2";
    
    
    ExGroupItem *group = [[ExGroupItem alloc] init];
    group.items = @[item0,item1,item2];
    
    [self.group addObject:group];
    self.viewModel.dataSource = [self.group copy];
}

-(void)configureCell:(BaseTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object
{
    if (indexPath.row != (self.viewModel.dataSource.count - 1)) {
        [cell addBottomLineWithLeftMargin:20 rightMargin:0 color:kRandomColor height:1];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"this is : %ld",(long)indexPath.row];
    cell.backgroundColor = kRandomColor;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
