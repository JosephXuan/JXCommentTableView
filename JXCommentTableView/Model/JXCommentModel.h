//
//  JXCommentModel.h
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/28.
//  Copyright © 2019 JosephXuan. All rights reserved.
//
//评论model（包含回复列表）
#import <Foundation/Foundation.h>
#import "JXCommentTools.h"
#import "JXCommentChildModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JXCommentModel : NSObject

@property (nonatomic, strong) NSString * beCoverImg;
@property (nonatomic, strong) NSString * beTitle;
@property (nonatomic, assign) NSInteger beUserId;
@property (nonatomic, strong) NSString * beVideo;
@property (nonatomic, assign) NSInteger commentNum;
@property (nonatomic, assign) NSInteger contentCommentId;
@property (nonatomic, assign) NSInteger createTime;
@property (nonatomic, strong) NSString * createTimeFormat;
@property (nonatomic, strong) NSString * descriptionField;
@property (nonatomic, assign) NSInteger fromId;
@property (nonatomic, assign) NSInteger fromTo;
@property (nonatomic, strong) NSString * gender;
@property (nonatomic, strong) NSString * headImg;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, assign) NSInteger isLike;
@property (nonatomic, assign) NSInteger likeNum;
@property (nonatomic, strong) NSString * nickName;
@property (nonatomic, assign) NSInteger qwAnShow;
@property (nonatomic, assign) NSInteger starLevel;
@property (nonatomic, strong) NSArray * jxRespContentCommentVO;
@property (nonatomic, assign) NSInteger userId;

@end

NS_ASSUME_NONNULL_END
