//
//  JXCommentTableSectionFootView.h
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/29.
//  Copyright © 2019 JosephXuan. All rights reserved.
//
//分割线 分割（评论和多个回复）
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXCommentTableSectionFootView : UITableViewHeaderFooterView

/** 创建单例 */
+ (instancetype)videoTopicFooterView;
/** 创建 */
+ (instancetype)footerViewWithTableView:(UITableView *)tableView;

- (void)setSection:(NSInteger)section allSections:(NSInteger)sections;


@end

NS_ASSUME_NONNULL_END
