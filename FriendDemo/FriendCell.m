//
//  FriendCell.m
//  FriendDemo
//
//  Created by 李雪阳 on 2020/3/23.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import "FriendCell.h"
#import "BaseWebViewController.h"

#import "PicContainerView.h"

@interface FriendCell ()

@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) UILabel *nickName;
@property (nonatomic,strong) YYLabel *content;
@property (nonatomic,strong) PicContainerView *picsView;
@property (nonatomic,strong) UILabel *time;

@end

#define picWidth ((SCREEN_WIDTH-30-20)/3)

@implementation FriendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.backgroundColor=[UIColor whiteColor];
        
        [self setUI];
        
    }
    return self;
}


- (void)setUI{
    
    _icon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"headerIcon"]];
    _icon.backgroundColor=[UIColor blueColor];
    _icon.layer.masksToBounds=YES;
    _icon.layer.cornerRadius=25;
    [self addSubview:_icon];
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(15);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    _nickName=[UILabel new].func_font(FontMedium(14)).func_textColor(FONT_COLOR333).func_text(@"nickName");
    [self addSubview:_nickName];
    [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.icon.mas_top);
        make.left.mas_equalTo(self.icon.mas_right).offset(10);
    }];
    
    _content=[YYLabel new];
    _content.numberOfLines=0;
    _content.preferredMaxLayoutWidth=SCREEN_WIDTH-90;
    _content.textAlignment=NSTextAlignmentLeft;
    [self addSubview:_content];
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nickName.mas_left);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(self.nickName.mas_bottom).offset(15);
    }];
    
    _picsView=[PicContainerView new];
    [self addSubview:_picsView];
//    [_picsView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.top.mas_equalTo(self.content.mas_bottom).offset(10);
//    }];
    
    
    _time=[UILabel new].func_font(FontRegular(12)).func_textColor(FONT_COLOR999).func_text(@"2020年03月23日");
    [self addSubview:_time];
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.picsView.mas_bottom).offset(10);
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(-10);
    }];
    
    //标记布局的view  出错时定位打印  可以屏蔽
    MASAttachKeys(self.picsView,self.content,self.nickName,self.icon,self.time);
}


- (void)setModel:(FriendModel *)model{
    _nickName.text=model.nickName;
    _content.text=model.content;
    

    NSString *textString = model.content;
    NSMutableAttributedString *contentStr = [[NSMutableAttributedString alloc] initWithString:textString];
    contentStr.yy_font=FontRegular(12);
    contentStr.yy_color=FONT_COLOR666;
    [contentStr yy_setTextHighlightRange:[textString rangeOfString:@"https://www.jianshu.com/u/e0d9441b4d9b"] color:[UIColor blueColor] backgroundColor:[UIColor blueColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        BaseWebViewController *web=[BaseWebViewController new];
        [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.jianshu.com/u/e0d9441b4d9b"]]];
        [[UIViewController currentViewController].navigationController pushViewController:web animated:YES];
    }];
    
    _content.attributedText = contentStr;
    
    _picsView.picArray=model.pics;
    [self.picsView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.content.mas_bottom).offset(10).with.priorityHigh();
        make.left.equalTo(self.nickName);
    }];
}


@end
