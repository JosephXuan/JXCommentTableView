//
//  JXCommentTableSectionFootView.m
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/29.
//  Copyright © 2019 JosephXuan. All rights reserved.
//

#import "JXCommentTableSectionFootView.h"
#import "JXCommentTools.h"
@interface JXCommentTableSectionFootView ()
/** 分割线 */
@property (strong, nonatomic) UIView *divider;

/** 第几组 */
@property (nonatomic , assign) NSInteger section;

@end


@implementation JXCommentTableSectionFootView

+ (instancetype)videoTopicFooterView{
    return [[self alloc] init];
}

+ (instancetype)footerViewWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"TopicFooter";
    JXCommentTableSectionFootView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (footer == nil) {
        // 缓存池中没有, 自己创建
        footer = [[self alloc] initWithReuseIdentifier:ID];
    }
    return footer;
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 初始化
        [self setUpView];
        
    }
    return self;
    
}

-(void)setUpView{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UIView *divider = [[UIView alloc]init];
    self.divider = divider;
    //self.divider.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    [self.contentView addSubview:divider];
    
    [self.divider mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.bottom.and.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
}

#pragma mark - 公共方法
- (void)setSection:(NSInteger)section allSections:(NSInteger)sections{
    self.section = section;
    
    if (sections == 1) {
        
        self.divider.hidden = YES;
        
    } else if (section == 0) { // 首行
        self.divider.hidden = NO;
        
    } else if (section == sections - 1) { // 末行
        
        self.divider.hidden = YES;
        
    } else { // 中间
        
        self.divider.hidden = NO;
        
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
