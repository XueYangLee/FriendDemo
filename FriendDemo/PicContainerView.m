//
//  PicContainerView.m
//  FriendDemo
//
//  Created by 李雪阳 on 2020/3/23.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import "PicContainerView.h"

@interface PicContainerView ()

@property (nonatomic, strong) NSArray *imageViewArray;

@end

@implementation PicContainerView


-(instancetype)init{
    self = [super init];
    
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    
    NSMutableArray *temp = [NSMutableArray new];
    
    for (int i = 0; i < 9; i++) {
        UIImageView *imageView = [UIImageView new];
        [self addSubview:imageView];
        imageView.tag = i;
        [temp addObject:imageView];
    }
    
    self.imageViewArray = [temp copy];
}

- (void)setPicArray:(NSArray *)picArray{
    _picArray = picArray;
    
    [self dealData];
    
}

-(void)dealData{
    for (long i = _picArray.count; i < self.imageViewArray.count; i++) {
        UIImageView *imageView = [self.imageViewArray objectAtIndex:i];
        imageView.hidden = YES;
    }
    
    if (_picArray.count == 0) {
        
        [self mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
            make.width.mas_equalTo(0);
        }];
        
        return;
    }
    
    CGFloat itemW = [self itemWidthForPicPathArray:_picArray];
    CGFloat itemH = itemW;
    long perRowItemCount = [self perRowItemCountForPicPathArray:_picArray];
    CGFloat margin = 5;
    
    [self.picArray enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        long columnIndex = idx % perRowItemCount;
        long rowIndex = idx / perRowItemCount;
        UIImageView *imageView = [self.imageViewArray objectAtIndex:idx];
        imageView.hidden = NO;
        NSString *imgStr = self.picArray[idx];
        imageView.image=[UIImage imageNamed:imgStr];

        [imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(columnIndex * (itemW + margin));
            make.top.mas_equalTo(rowIndex * (itemH + margin));
            make.width.mas_equalTo(itemW);
            make.height.mas_equalTo(itemH);
        }];
    }];
    
    CGFloat w = perRowItemCount * itemW + (perRowItemCount - 1) * margin;
    int columnCount = ceilf(_picArray.count * 1.0 / perRowItemCount);
    CGFloat h = columnCount * itemH + (columnCount - 1) * margin;
    
    
    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(h);
        make.width.mas_equalTo(w);
    }];
    
}



- (CGFloat)itemWidthForPicPathArray:(NSArray *)array
{
    if (array.count == 1) {
        return 120;
    } else {
        CGFloat w = ([UIScreen mainScreen].bounds.size.width - 100)/3;
        return w;
    }
}

- (NSInteger)perRowItemCountForPicPathArray:(NSArray *)array
{
    if (array.count <= 3) {
        return array.count;
    } else {
        return 3;
    }
}


@end
