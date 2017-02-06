//
//  RootCell.h
//  AutolayoutTableViewCell
//
//  Created by aDu on 2017/1/21.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootModel.h"

@interface RootCell : UITableViewCell

@property (nonatomic, strong) RootModel *model;
- (CGFloat)cellHeight:(RootModel *)model;

@end
