//
//  JXCommentTabHeadView.m
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/29.
//  Copyright © 2019 JosephXuan. All rights reserved.
//

#import "JXCommentTabHeadView.h"
#import "JXCommentTools.h"
@interface JXCommentTabHeadView ()

//头像
@property (nonatomic, strong) UIImageView *headImgView;
//昵称
@property(nonatomic, strong) UILabel *nickNameLab;
//时间
@property(nonatomic, strong) UILabel *timerLab;
//内容
@property (nonatomic, strong) UILabel * contentLab;
//底部分割线
@property (nonatomic, strong) UIView *lineView;

@end

@implementation JXCommentTabHeadView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setUP];
        
    }
    return self;
}

-(void)setUP{
    
    //头像
    [self addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.top.offset(10);
        make.width.offset(40);
        make.height.offset(40);
    }];
    self.headImgView.layer.cornerRadius = 20.0f;
    self.headImgView.layer.masksToBounds = YES;
    
    //昵称
    [self addSubview:self.nickNameLab];
    [self.nickNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView.mas_top);
        make.left.equalTo(self.headImgView.mas_right).offset(5);
    }];
    self.nickNameLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    self.nickNameLab.textColor = [UIColor colorWithHexString:@"#666666"];
    
    //时间
    [self addSubview:self.timerLab];
    [self.timerLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickNameLab.mas_left);
        make.top.equalTo(self.nickNameLab.mas_bottom).offset(5);
    }];
    self.timerLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    self.timerLab.textColor = [UIColor colorWithHexString:@"#999999"];
    
    //内容
    [self addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView.mas_bottom).offset(10);
        make.left.equalTo(self.headImgView.mas_left).offset(5);
        make.right.offset(-15);
        
    }];
    self.contentLab.numberOfLines = 0;
    self.contentLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    self.contentLab.textColor = [UIColor colorWithHexString:@"#39414d"];
    
    //分割线
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
        make.height.offset(10);
    }];
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self setDataLocal];
    
}
#pragma mark --set
-(void)setDataLocal{
    //头像
    self.headImgView.image = [UIImage imageNamed:@"headImg"];
    //昵称
    self.nickNameLab.text = @"宝赞";
    //时间
    self.timerLab.text = @"2019-09-09";
    //内容
    self.contentLab.text = @"笑看世间 痴人万千 白首同眷 实难得见 人面桃花 是谁在扮演 时过境迁 故人难见 旧日黄昏 映照新颜 相思之苦 谁又敢直言 梨花香 却让人心感伤 愁断肠 千杯酒解思量 莫相忘 旧时人新模样 思望乡 时过境迁 故人难见 旧日黄昏 映照新颜 相思之苦 谁又敢直言 为情伤 世间事皆无常 笑沧桑 万行泪化寒窗 勿彷徨 脱素裹着春装 忆流芳 笑我太过痴狂 相思夜未央 独我孤芳自赏";
}
+(CGFloat)returnHeight{
    return 220;
}
//头像
- (UIImageView *)headImgView{
    if (!_headImgView){
        _headImgView = [[UIImageView alloc]init];
    }
    return _headImgView;
}
//昵称
- (UILabel *)nickNameLab{
    if (!_nickNameLab){
        _nickNameLab = [[UILabel alloc]init];
    }
    return _nickNameLab;
}
//时间
- (UILabel *)timerLab{
    if (!_timerLab){
        _timerLab = [[UILabel alloc]init];
    }
    return _timerLab;
}
//内容
- (UILabel *)contentLab{
    if (!_contentLab){
        _contentLab = [[UILabel alloc]init];
    }
    return _contentLab;
}
//分割线
- (UIView *)lineView{
    if (!_lineView){
        _lineView = [[UIView alloc]init];
    }
    return _lineView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
