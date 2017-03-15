//
//  FirstModel.h
//  AutolayoutTableViewCell
//
//  Created by aDu on 2017/3/15.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FirstModel : NSObject

@property (nonatomic, copy) NSURL *signedIconPath; //图片地址
@property (nonatomic, copy) NSString *name; //标题
@property (nonatomic, copy) NSString *remark; //内容
@property (nonatomic, copy) NSString *posterId; //内容ID
@property (nonatomic, assign) BOOL subscribe; //订阅状态

@property (nonatomic, assign) CGFloat cellHeight; //自适应高度

@end
