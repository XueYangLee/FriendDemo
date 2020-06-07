//
//  FriendModel.h
//  FriendDemo
//
//  Created by 李雪阳 on 2020/3/23.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FriendModel : NSObject

@property (nonatomic,copy) NSString *nickName;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,strong) NSArray *pics;

@end

NS_ASSUME_NONNULL_END
