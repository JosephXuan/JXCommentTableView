//
//  JXCommentTableView.h
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/25.
//  Copyright © 2019 JosephXuan. All rights reserved.
// 感谢 https://www.jianshu.com/p/395bac3648a7 提供思路    https://github.com/CoderMikeHe
// 结构为 段头+Cell+段尾
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol didSelectCellDelegate <NSObject>

@optional
//cell的点击方法
- (void)tableView:(UITableView *)tableView didselectIndexPath:(NSIndexPath *)indexPath;
//headView点击方法
- (void)tableView:(UITableView *)tableView didClickSection:(NSInteger)section;

@end

static NSString *const commentsCellID=@"commentsTabCell";
static NSString *const commentsHeaderID=@"commentsHeadView";
static NSString *const commentsFooterID=@"commentsFooterView";

@interface JXCommentTableView : UITableView

//评论的数据 (传入model 类)
@property(nonatomic,strong)NSArray * commentArr;

//代理
@property (nonatomic, weak) id<didSelectCellDelegate> cellDelegate;

@end

NS_ASSUME_NONNULL_END
