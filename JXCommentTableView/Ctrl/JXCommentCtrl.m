//
//  JXCommentCtrl.m
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/28.
//  Copyright © 2019 JosephXuan. All rights reserved.
//

#import "JXCommentCtrl.h"
#import "JXCommentTools.h"//工具类
#import "JXCommentModel.h"//model类
#import "JXCommentTableView.h"//tableView类
#import "JXCommentTabHeadView.h"//表头
#import "JXCommentTableSectionHeadView.h"//段头
#import "JXCommentTableCell.h"//cell
#import "JXCommentTableSectionFootView.h"//段尾

@interface JXCommentCtrl ()
//tabView
@property (nonatomic, strong) JXCommentTableView *tableView;
//表头
@property (nonatomic, strong) JXCommentTabHeadView *tabHeadView;
//数据源
@property (nonatomic, strong) NSMutableArray *totalMuArr;

@end

@implementation JXCommentCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //设置ui
    [self setUpView];
    //处理数据
    [self dealDataSource];
}
-(void)dealDataSource{
    
    NSDictionary *dataDic = [JXCommentTools dataDicForExamList];
    
    NSArray  *listArr = dataDic[@"jxRespContentCommentVOList"];
    
    [self.totalMuArr removeAllObjects];
    for (NSDictionary *infoDic in listArr) {
        JXCommentModel *model = [JXCommentModel yy_modelWithJSON:infoDic];
        [self.totalMuArr addObject:model];
    }
    
    CGFloat tabHeadHeight = [JXCommentTabHeadView returnHeight];
    self.tabHeadView.frame = CGRectMake(0, 0, KAppScreenWidth, tabHeadHeight);
    
    self.tableView.tableHeaderView = self.tabHeadView;
    
    self.tableView.commentArr=[self.totalMuArr copy];
    
    [self.tableView reloadData];
   // NSLog(@"数据类型>>>%@",dataDic);
    
}
-(void)setUpView{
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(JXCommentTableView *)tableView{
    if (!_tableView) {
        _tableView = [[JXCommentTableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
         _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;

         //段头
          [_tableView registerClass:[JXCommentTableSectionHeadView class] forHeaderFooterViewReuseIdentifier:commentsHeaderID];

          //cell
          [_tableView registerClass:[JXCommentTableCell class] forCellReuseIdentifier:commentsCellID];
         
          //段尾
          [_tableView registerClass:[JXCommentTableSectionFootView class] forHeaderFooterViewReuseIdentifier:commentsFooterID];
        
         _tableView.backgroundColor=[UIColor whiteColor];
    }
    return _tableView;
}
-(NSMutableArray *)totalMuArr{
    if (!_totalMuArr) {
        _totalMuArr = [[NSMutableArray alloc]init];
    }
    return _totalMuArr;
}
-(JXCommentTabHeadView *)tabHeadView{
    if (!_tabHeadView) {
        _tabHeadView = [[JXCommentTabHeadView alloc]initWithFrame:CGRectMake(0, 0, KAppScreenWidth, 1)];
    }
    return _tabHeadView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
