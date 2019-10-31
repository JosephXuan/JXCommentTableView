//
//  JXCommentTools.m
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/28.
//  Copyright © 2019 JosephXuan. All rights reserved.
//

#import "JXCommentTools.h"

@implementation JXCommentTools

//伪造的本地数据
+(NSDictionary *)dataDicForExamList{
  
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

   // NSArray *listArr=arr;
    
    
    return dic;
    
}

@end
