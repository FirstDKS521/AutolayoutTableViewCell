//
//  RootViewController.m
//  AutolayoutTableViewCell
//
//  Created by aDu on 2017/1/21.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "RootViewController.h"
#import "RootCell.h"
#import "RootModel.h"

#define K_Cell @"cell"
@interface RootViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RootCell *tempCell;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自适应";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    for (int i = 0; i < 20; i++) {
        RootModel *model = [[RootModel alloc] init];
        model.timeStr = @"12:20";
        model.detailStr = @"查看详情";
        model.teger = arc4random() % 5 + 0;
        [self.dataArray addObject:model];
        NSLog(@"%@", @(model.teger));
    }
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RootModel *model = self.dataArray[indexPath.row];
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
    RootCell *cell = [tableView dequeueReusableCellWithIdentifier:K_Cell forIndexPath:indexPath];
    [cell setModel:self.dataArray[indexPath.row]];
    return cell;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        [_tableView registerClass:[RootCell class] forCellReuseIdentifier:K_Cell];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        self.tempCell = [[RootCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:K_Cell];
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
