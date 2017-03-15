//
//  FirstCell.m
//  AutolayoutTableViewCell
//
//  Created by aDu on 2017/3/15.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "FirstCell.h"
#import "UIView+SYFrameTool.h"
#import "Masonry.h"

@interface FirstCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *stateLabel;

@end

@implementation FirstCell

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
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 30;

        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.left.equalTo(self.contentView.mas_left).offset(10);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
        }];
        
        [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentLabel.mas_bottom).offset(8);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        }];
        
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return self;
}

- (void)setModel:(FirstModel *)model
{
    if (_model != model) {
        NSLog(@"前%@", @(self.contentLabel.height));
        self.titleLabel.text = model.name;
        self.contentLabel.text = model.remark;
        NSLog(@"后%@", @(self.contentLabel.height));
        
        self.stateLabel.text = @"已关注";
    }
    _model = model;
}

- (CGFloat)cellHeight:(FirstModel *)model
{
    [self setModel:model];
    CGFloat cellHeight = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize].height;
    return cellHeight;
}

#pragma mark - init

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.numberOfLines = 2;
        _contentLabel.backgroundColor = [UIColor brownColor];
        [self.contentView addSubview:_contentLabel];
    }
    return _contentLabel;
}

- (UILabel *)stateLabel
{
    if (!_stateLabel) {
        _stateLabel = [UILabel new];
        _stateLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_stateLabel];
    }
    return _stateLabel;
}

@end
