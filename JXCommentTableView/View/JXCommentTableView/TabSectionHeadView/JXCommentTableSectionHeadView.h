//
//  JXCommentTableSectionHeadView.h
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/29.
//  Copyright © 2019 JosephXuan. All rights reserved.
//
//展示评论
#import <UIKit/UIKit.h>
#import "JXCommentModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JXCommentTableSectionHeadView : UITableViewHeaderFooterView

/** 赋值 */
@property (nonatomic, strong) JXCommentModel *commentModel;
/** 索引 */
@property (assign, nonatomic) NSInteger viewSection;
/** 单例创建  */
+ (instancetype)topicHeaderView;
/** 创建  */
+ (instancetype)headerViewWithTableView:(UITableView *)tableView withIdentifierStr:(NSString *)identifier;
/** 返回高度 */
+ (CGFloat)returnHeightWithCommentModel:(JXCommentModel *)commentModel;

@end

NS_ASSUME_NONNULL_END
