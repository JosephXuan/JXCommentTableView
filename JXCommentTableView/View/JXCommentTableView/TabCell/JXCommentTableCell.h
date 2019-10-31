//
//  JXCommentTableCell.h
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/29.
//  Copyright © 2019 JosephXuan. All rights reserved.
//
//展示回复
#import <UIKit/UIKit.h>
#import "JXCommentChildModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JXCommentTableCell : UITableViewCell

//赋值数据
@property (nonatomic, strong) JXCommentChildModel *childModel;

/** 快速创建Cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView withIdentifier:(NSString *)cellIdentifier indexPath:(NSIndexPath *)indexPath;

/** 计算高度 */
+ (CGFloat)returnHeightWithChildModel:(JXCommentChildModel *)childModel;

@end

NS_ASSUME_NONNULL_END
