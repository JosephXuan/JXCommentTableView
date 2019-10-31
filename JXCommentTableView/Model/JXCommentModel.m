//
//  JXCommentModel.m
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/28.
//  Copyright © 2019 JosephXuan. All rights reserved.
//

#import "JXCommentModel.h"

@implementation JXCommentModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"descriptionField" : @"description",@"idField" : @"id"};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"jxRespContentCommentVO":[JXCommentChildModel class]};
}

@end
