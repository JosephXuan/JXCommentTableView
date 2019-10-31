//
//  JXCommentTableSectionHeadView.m
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/29.
//  Copyright © 2019 JosephXuan. All rights reserved.
//

#import "JXCommentTableSectionHeadView.h"
#import "JXCommentTools.h"
@interface JXCommentTableSectionHeadView ()

//头像
@property (nonatomic, strong)UIImageView *titleImgView;
//昵称
@property (nonatomic, strong)UILabel *nickLab;
//时间
@property (nonatomic, strong)UILabel *timerLab;
//评论内容
@property (nonatomic, strong)YYLabel  *contentLab;

@end

@implementation JXCommentTableSectionHeadView
+ (instancetype)topicHeaderView{
    return [[self alloc] init];
}

/** 创建  */
+ (instancetype)headerViewWithTableView:(UITableView *)tableView withIdentifierStr:(NSString *)identifier{
    
    
    JXCommentTableSectionHeadView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (header == nil) {
        // 缓存池中没有, 自己创建
        // MHLog(@"....创建表头...");
        header = [[self alloc] initWithReuseIdentifier:identifier];
    }
    return header;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化
        self.contentView.backgroundColor=[UIColor whiteColor];
        [self setUpView];
        
    }
    return self;
    
}
-(void)setUpView{
    
    //头像
    [self addSubview:self.titleImgView];
    [self.titleImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.top.offset(10);
        make.width.offset(40);
        make.height.offset(40);
    }];
    self.titleImgView.layer.cornerRadius = 20.0f;
    self.titleImgView.layer.masksToBounds = YES;
    
    //昵称
    [self addSubview:self.nickLab];
    [self.nickLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleImgView.mas_top);
       make.left.equalTo(self.titleImgView.mas_right).offset(10);
    }];
    self.nickLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    self.nickLab.textColor = [UIColor colorWithHexString:@"#39414d"];
    
    //时间
    [self addSubview:self.timerLab];
    [self.timerLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickLab.mas_left).offset(0);
        make.top.equalTo(self.nickLab.mas_bottom).offset(5);
    }];
    
    self.timerLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    self.timerLab.textColor = [UIColor colorWithHexString:@"#999999"];
    //评论内容
    [self addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timerLab.mas_left).offset(0);
        make.top.equalTo(self.timerLab.mas_bottom).offset(10);
        make.right.offset(-15);
    }];
    self.contentLab.numberOfLines=0;
    //左间距-头像-头像间距-右间距
    CGFloat c_width = KAppScreenWidth-10-40-10-15;
    self.contentLab.preferredMaxLayoutWidth = c_width;
    self.contentLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    self.contentLab.textColor = [UIColor colorWithHexString:@"#666666"];
}

-(void)setCommentModel:(JXCommentModel *)commentModel{
    _commentModel = commentModel;
    
    //头像
    [self.titleImgView sd_setImageWithURL:[NSURL URLWithString:commentModel.headImg] placeholderImage:nil];
    //昵称
    self.nickLab.text = commentModel.nickName;
    //时间
    self.timerLab.text = commentModel.createTimeFormat;
    //评论内容
    self.contentLab.text = commentModel.descriptionField;
    
}

+ (CGFloat)returnHeightWithCommentModel:(JXCommentModel *)commentModel{
    
    //左间距-头像-头像间距-右间距
    CGFloat c_width=KAppScreenWidth-10-40-10-15;
    CGSize  textLimitSize = CGSizeMake(c_width, MAXFLOAT);
       
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString: commentModel.descriptionField];
    mutableAttributedString.yy_font=[UIFont fontWithName:@"PingFangSC-Regular" size:16];
       
    CGFloat textH = [YYTextLayout layoutWithContainerSize:textLimitSize text:mutableAttributedString].textBoundingSize.height;
    
    return textH + 80;
}

//头像
-(UIImageView *)titleImgView{
    if (!_titleImgView) {
        _titleImgView = [[UIImageView alloc] init];
    }
    return _titleImgView;
}
//昵称
-(UILabel *)nickLab{
    if (!_nickLab) {
        _nickLab = [[UILabel alloc]init];
    }
    return _nickLab;
}

//时间
-(UILabel *)timerLab{
    if (!_timerLab) {
        _timerLab = [[UILabel alloc]init];
    }
    return _timerLab;
}
//评论内容
-(YYLabel *)contentLab{
    if (!_contentLab) {
        _contentLab = [[YYLabel alloc]init];
    }
    return _contentLab;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
