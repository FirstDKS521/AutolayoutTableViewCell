//
//  RootModel.h
//  AutolayoutTableViewCell
//
//  Created by aDu on 2017/1/21.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RootModel : NSObject

@property (nonatomic, copy) NSString *timeStr;
@property (nonatomic, copy) NSString *detailStr;
@property (nonatomic, assign) NSInteger teger;

@property (nonatomic, assign) CGFloat cellHeight;

@end
