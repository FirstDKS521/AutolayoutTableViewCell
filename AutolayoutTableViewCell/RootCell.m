//
//  RootCell.m
//  AutolayoutTableViewCell
//
//  Created by aDu on 2017/1/21.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "RootCell.h"
#import "Masonry.h"

@interface RootCell ()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation RootCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor orangeColor];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.height.equalTo(@20);
            make.width.equalTo(@60);
        }];
        
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
            make.left.equalTo(self.contentView.mas_left).offset(16);
            make.right.equalTo(self.contentView.mas_right).offset(-16);
//            make.height.equalTo(@0);
        }];
        
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.top.equalTo(self.backView.mas_bottom).offset(5);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
    }
    return self;
}

- (void)setModel:(RootModel *)model
{
    self.timeLabel.text = model.timeStr;
    self.detailLabel.text = model.detailStr;
    
    for (UILabel *subLabel in self.backView.subviews) {
        [subLabel removeFromSuperview];
    }
    if (model.teger == 0) {
//        UILabel *label = [UILabel new];
//        label.backgroundColor = [UIColor brownColor];
//        [self.backView addSubview:label];
//        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.backView.mas_left);
//            make.top.equalTo(self.backView.mas_top);
//            make.bottom.equalTo(self.backView.mas_bottom);
//        }];
    } else {
        UILabel *lastLabel = nil;
        for (int i = 0; i < model.teger; i++) {
            UILabel *label = [UILabel new];
            label.backgroundColor = [UIColor brownColor];
            label.text = @"测试数据";
            [self.backView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.backView.mas_left);
                if (!lastLabel) {
                    make.top.equalTo(self.backView.mas_top).offset(5);
                } else {
                    make.top.equalTo(lastLabel.mas_bottom).offset(5);
                }
//                if (i == model.teger - 1) {
//                    make.bottom.equalTo(self.backView.mas_bottom).offset(-5);
//                }
            }];
            lastLabel = label;
        }
//        [self.backView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(lastLabel.mas_bottom).offset(5);
//        }];
        [lastLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.backView.mas_bottom).offset(-5);
        }];
    }
}

- (CGFloat)cellHeight:(RootModel *)model
{
    [self setModel:model];
    CGFloat cellHeight = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
    return cellHeight;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.backgroundColor = [UIColor whiteColor];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_timeLabel];
    }
    return _timeLabel;
}

- (UIView *)backView
{
    if (!_backView) {
        _backView = [UIView new];
        _backView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_backView];
    }
    return _backView;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.backgroundColor = [UIColor whiteColor];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_detailLabel];
    }
    return _detailLabel;
}

@end
