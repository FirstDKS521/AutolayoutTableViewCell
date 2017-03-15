//
//  FirstCell.h
//  AutolayoutTableViewCell
//
//  Created by aDu on 2017/3/15.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"

@interface FirstCell : UITableViewCell

@property (nonatomic, strong) FirstModel *model;
- (CGFloat)cellHeight:(FirstModel *)model;

@end
