//
//  JXCommentChildModel.m
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/28.
//  Copyright © 2019 JosephXuan. All rights reserved.
//

#import "JXCommentChildModel.h"

@implementation JXCommentChildModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"descriptionField" : @"description"};
}

- (NSAttributedString *)reChildTextAttributedText{
    
    NSString *nickNameStr=self.nickName;
    NSString *beNickNameStr=self.beNickName;
   
    if (self.beUserId!=0) {
        
        // 有回复 xx 回复 xxx :xxxxx
        NSString *textString = [NSString stringWithFormat:@"%@ 回复 %@: %@", nickNameStr, beNickNameStr, self.descriptionField];
        NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:textString];
        
        mutableAttributedString.yy_font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        mutableAttributedString.yy_color = [UIColor colorWithHexString:@"#39414d"];
        mutableAttributedString.yy_lineSpacing = 2;
        
        
        NSRange fromUserRange = NSMakeRange(0, nickNameStr.length);
        YYTextHighlight *fromUserHighlight = [YYTextHighlight highlightWithBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]];
        fromUserHighlight.userInfo = @{@"uid":@(self.userId),@"des":@"写在model类中处理赋值属性"};
        
        [mutableAttributedString yy_setTextHighlight:fromUserHighlight range:fromUserRange];
        
        // 设置昵称颜色
        [mutableAttributedString yy_setColor:[UIColor orangeColor] range:NSMakeRange(0, nickNameStr.length)];
//--------------------------------------------------------
        //设置回复人
        NSRange toUserRange = [textString rangeOfString:[NSString stringWithFormat:@"%@:",beNickNameStr]];
        // 文本高亮模型
        YYTextHighlight *toUserHighlight = [YYTextHighlight highlightWithBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]];
        // 这里痛过属性的userInfo保存User模型，后期通过获取模型然后获取User模型 最好写成全局属性
        toUserHighlight.userInfo = @{@"uid":@(self.beUserId),@"des":@"写在model类中处理赋值属性"};
        
        // 点击用户的昵称的事件传递
        //        toUserHighlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect)
        //        {
        //            // 这里通过通知把用户的模型传递出去
        //        };
        
        [mutableAttributedString yy_setTextHighlight:toUserHighlight range:toUserRange];
        [mutableAttributedString yy_setColor:[UIColor orangeColor] range:toUserRange];
        return mutableAttributedString;
        
        
    }else{
         // 没有回复 xx: xxxxx
        NSString *textString;
        NSMutableAttributedString *mutableAttributedString;
        //有回复
           textString= [NSString stringWithFormat:@"%@: %@", nickNameStr, self.descriptionField];
          mutableAttributedString= [[NSMutableAttributedString alloc] initWithString:textString];
          mutableAttributedString.yy_font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
          mutableAttributedString.yy_color = [UIColor colorWithHexString:@"#39414d"];
          mutableAttributedString.yy_lineSpacing = 2;
          
          NSRange fromUserRange = NSMakeRange(0, nickNameStr.length+1);
          
          // 设置昵称颜色
          [mutableAttributedString yy_setColor:[UIColor orangeColor] range:fromUserRange];
          
          YYTextHighlight *fromUserHighlight = [YYTextHighlight highlightWithBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]];
          fromUserHighlight.userInfo = @{@"uid":@(self.userId)};
          [mutableAttributedString yy_setTextHighlight:fromUserHighlight range:fromUserRange];
          
        return mutableAttributedString;
       
    }
      /*
     */
    
    return nil;
}
@end
