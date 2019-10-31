//
//  JXCommentTableCell.m
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/29.
//  Copyright © 2019 JosephXuan. All rights reserved.
//

#import "JXCommentTableCell.h"
#import "JXCommentTools.h"
@interface JXCommentTableCell ()

/** 文本内容 */
@property (nonatomic, strong) YYLabel *contentLabel;

@end


@implementation JXCommentTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

/** 快速创建Cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView withIdentifier:(NSString *)cellIdentifier indexPath:(NSIndexPath *)indexPath{
    //static NSString *homeHoldLifeCellID=@"HomeHoldLifeCellID";
    
    JXCommentTableCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    /*
     cell.opaque=YES;
     cell.layer.drawsAsynchronously=YES;
     cell.layer.rasterizationScale=[UIScreen mainScreen].scale;
     */
    return cell;
}

/* 自定义Cell */
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self setUpView];
        self.contentView.backgroundColor=[UIColor colorWithHexString:@"#fafafa"];
    }
    return self;
}

-(void)setUpView{
    
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.offset(-10);
    }];
    self.contentLabel.numberOfLines = 1;
    self.contentLabel.textAlignment = NSTextAlignmentLeft;
    //左间距-头像-头像间距-右间距 - 文字左右间距
    CGFloat c_width = KAppScreenWidth-10-40-10-15-2*10;
    self.contentLabel.preferredMaxLayoutWidth = c_width;
    
    //__weak typeof(self) weakSelf = self;
    self.contentLabel.highlightTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        
        // 利用KVC获取UserInfo 其实可以在MHComment模型里面利用 通知告知控制器哪个用户被点击了
        YYTextHighlight *highlight = [containerView valueForKeyPath:@"_highlight"];
        /*
         * 此处可以设置cell的代理 在控制器里回调
         *
         */
        NSLog(@"点击高亮文字>>%@",highlight.userInfo);
        
    };
    
}
-(void)setChildModel:(JXCommentChildModel *)childModel{
    _childModel = childModel;
    //赋值回复内容
    self.contentLabel.attributedText = childModel.reChildTextAttributedText;
    //NSLog(@"展示内容>>%@",childModel.nickName);
   // self.contentLabel.text = @"测试~~";
    
}
/** 计算高度 */
+ (CGFloat)returnHeightWithChildModel:(JXCommentChildModel *)childModel{
    
    CGFloat c_width = KAppScreenWidth-10-40-10-15;
    CGSize  textLimitSize = CGSizeMake(c_width - 2 *10, MAXFLOAT);
    CGFloat textH = [YYTextLayout layoutWithContainerSize:textLimitSize text:childModel.reChildTextAttributedText].textBoundingSize.height;
       
    
    return textH + 10;
}
/** 重新布局cell位置 */
- (void)setFrame:(CGRect)frame{
    //左间距+头像+头像间距
    
    frame.origin.x = 10+40+10;
    //
    frame.size.width = KAppScreenWidth - frame.origin.x - 15;
    [super setFrame:frame];
    
}

- (YYLabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[YYLabel alloc]init];
    }
    return _contentLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
