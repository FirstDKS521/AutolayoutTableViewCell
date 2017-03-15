//
//  FirstViewController.m
//  AutolayoutTableViewCell
//
//  Created by aDu on 2017/3/15.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstCell.h"
#import "FirstModel.h"

#define K_Cell @"cell"
@interface FirstViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) FirstCell *tempCell;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自适应";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    for (int i = 0; i < 1; i++) {
        FirstModel *model = [[FirstModel alloc] init];
        model.name = @"测试数据";
        model.remark = @"开始大陆架卡拉胶大打卡机打开俺肯定就啊卡机的看开始大陆架卡拉胶大打卡机打开俺肯定就啊卡机的看";
        model.subscribe = YES;
        [self.dataArray addObject:model];
    }
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstModel *model = self.dataArray[indexPath.row];
    if (model.cellHeight == 0) {
        CGFloat cellHeight = [self.tempCell cellHeight:model];
        model.cellHeight = cellHeight;
        return cellHeight;
    } else {
        return model.cellHeight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstCell *cell = [tableView dequeueReusableCellWithIdentifier:K_Cell forIndexPath:indexPath];
    [cell setModel:self.dataArray[indexPath.row]];
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    FirstViewController *firstVC = [[FirstViewController alloc] init];
//    [self.navigationController pushViewController:firstVC animated:YES];
//}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        [_tableView registerClass:[FirstCell class] forCellReuseIdentifier:K_Cell];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        self.tempCell = [[FirstCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:K_Cell];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}

@end
