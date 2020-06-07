//
//  FriendViewController.m
//  FriendDemo
//
//  Created by 李雪阳 on 2020/3/23.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import "FriendViewController.h"
#import "FriendCell.h"
#import "FriendModel.h"

@interface FriendViewController ()

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=@"朋友圈";
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendCell *cell=[tableView dequeueReusableCellWithIdentifier:@"friend"];
    if (!cell) {
        cell=[[FriendCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"friend"];
    }
    cell.model=self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 290;
}


- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray=[NSMutableArray array];
        
        NSArray *nameArr=@[@"二哈",@"狗子",@"拆家王",@"萨摩耶",@"金毛"];
        NSArray *contentArr=@[@"暗示分离喀什家乐福捡垃圾雷锋精神垃圾费拉几十块",
                              @"上岛咖啡就刻录机萨拉解放路撒家乐福结束啦就拉水电费阿撒旦法师的法师发送到发送到发顺丰阿士大夫撒发",
                              @"情侣款忘鸡儿李建伟录入进去为了让据了解垃圾分类；啊打飞机",
                              @"两分钱价位了容积率为进入了较为老人家垃圾分类说的",
                              @"阿基里https://www.jianshu.com/u/e0d9441b4d9b斯弗利萨简历发聚少离多",
                              @"徕卡三等奖发链接萨拉测试连接https://www.jianshu.com/u/e0d9441b4d9b",
                              @"https://www.jianshu.com/u/e0d9441b4d9b",
                              @"去玩儿确认了开机了",
                              @"奥科吉拉萨杰弗里斯多久啊联发科静安寺龙卷风了就撒辽阔的房间里是街坊邻居爱上了",
                              @"去玩儿翁群若若群无；卡死了发接口拉萨砥砺奋进撒垃圾分类",
                              @"签完了借款人了解放路https://www.jianshu.com/u/e0d9441b4d9b卡萨丁家附近爱睡阿士大夫撒旦法所发生的觉覅就"];
        NSArray *imgArray=@[@"icon0",@"icon1",@"icon2",@"icon3",@"icon4",@"icon5",@"icon6",@"icon7",@"icon8"];
        
        for (NSInteger i=0; i<100; i++) {
            FriendModel *model=[FriendModel new];
            model.nickName=nameArr[arc4random_uniform(5)];
            model.content=contentArr[arc4random_uniform(11)];
            
            int random = arc4random_uniform(9);
            NSMutableArray *images=[NSMutableArray array];
            for (NSInteger i=0; i<random; i++) {
                [images addObject:imgArray[i]];
            }
            model.pics=images;
            
            [self.dataArray addObject:model];
        }
        
    }
    return _dataArray;
}



@end
