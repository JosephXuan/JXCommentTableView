//
//  JXCommentTableView.m
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/25.
//  Copyright © 2019 JosephXuan. All rights reserved.
//

#import "JXCommentTableView.h"
#import "JXCommentTableSectionHeadView.h"//段头
#import "JXCommentTableCell.h"//cell
#import "JXCommentTableSectionFootView.h"//段尾
#import "JXCommentModel.h"//model

@interface JXCommentTableView() <UITableViewDataSource,UITableViewDelegate>


@end

@implementation JXCommentTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
    }
    return self;
}

#pragma mark - UITableViewDelegate , UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
   
   
    //返回评论数
    // NSLog(@"多少行数据>>%ld",self.commentArr.count);
    return self.commentArr.count;
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //返回回复数
     JXCommentModel *commentModel;
    if (section<self.commentArr.count) {
        commentModel=self.commentArr[section];
    }
    NSArray *listArr=commentModel.jxRespContentCommentVO;
    return listArr.count;
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //展示评论区
    JXCommentTableCell *cell = [JXCommentTableCell cellWithTableView:tableView withIdentifier:commentsCellID indexPath:indexPath];
    //回复数据cell
    JXCommentModel *commentModel;
    if (indexPath.section<self.commentArr.count) {
        commentModel=self.commentArr[indexPath.section];
    }
    JXCommentChildModel *childModel;
    NSArray *listArr=commentModel.jxRespContentCommentVO;
    if (indexPath.row<listArr.count) {
        childModel = listArr[indexPath.row];
    }
    cell.childModel = childModel;
    
   
   
    return cell;
   
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.commentArr.count<=0) {
        //没有评论
        return 0.01;
    }
    //回复内容的高度 一般都是默认一行 多出一行用...展示
    JXCommentModel *commentModel;
    if (indexPath.section<self.commentArr.count) {
        commentModel=self.commentArr[indexPath.section];
    }
    JXCommentChildModel *childModel;
    NSArray *listArr=commentModel.jxRespContentCommentVO;
    if (indexPath.row<listArr.count) {
        childModel = listArr[indexPath.row];
    }
    
    CGFloat cellHeight;
    if (childModel) {
        cellHeight=[JXCommentTableCell returnHeightWithChildModel:childModel];
    }else{
        cellHeight=0.f;
    }
    
    return cellHeight;
   
}


- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    //没有评论
    if (self.commentArr.count<=0) {
        return 0.01;
    }
    JXCommentModel *commentModel;
    if (section<self.commentArr.count) {
        commentModel=self.commentArr[section];
    }
    //有评论
    CGFloat headerHeight= [JXCommentTableSectionHeadView returnHeightWithCommentModel:commentModel];
    
    return headerHeight;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (self.commentArr.count==0) {
        //没有评论
        return 0.01;
    }
    
    JXCommentModel *commentModel;
    if (section<self.commentArr.count) {
        commentModel=self.commentArr[section];
    }
    return commentModel.jxRespContentCommentVO.count>0?10:1;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    //展示评论数据
    JXCommentTableSectionHeadView *headerView = [JXCommentTableSectionHeadView headerViewWithTableView:tableView withIdentifierStr:commentsHeaderID];
  
   JXCommentModel *commentModel;
   if (section<self.commentArr.count) {
       commentModel=self.commentArr[section];
   }
    
    headerView.commentModel = commentModel;
    headerView.viewSection=section;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(action_tap:)];
    headerView.tag = 300 + section;
    
    [headerView addGestureRecognizer:tap];
    
   // headerView.delegate = self;
    /*
    */
    return headerView;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
   
    if (self.commentArr.count==0) {
        //没有评论
        UIView *bgView=[[UIView alloc]init];
        bgView.backgroundColor=[UIColor whiteColor];
        return bgView;
    }
    //分割线
    JXCommentTableSectionFootView *footerView = [JXCommentTableSectionFootView footerViewWithTableView:tableView];
    
    [footerView setSection:section allSections:self.commentArr.count];
    //footerView.backgroundColor=[UIColor redColor];
    return footerView;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.cellDelegate respondsToSelector:@selector(tableView:didselectIndexPath:)]) {
        [_cellDelegate tableView:tableView didselectIndexPath:indexPath];
    }
    
}

#pragma mark --view点击
- (void)action_tap:(UIGestureRecognizer *)tap{
    
    NSString *str = [NSString stringWithFormat:@"%ld",(long)tap.view.tag - 300];
    NSInteger section=[str integerValue];
    if ([self.cellDelegate respondsToSelector:@selector(tableView:didClickSection:)]) {
        [_cellDelegate tableView:self didClickSection:section];
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
