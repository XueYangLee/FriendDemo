# FriendDemo

简易朋友圈，纯masonry布局，使用estimatedHeight自动计算高度而无需计算cell高度


```

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
```

![参考](https://github.com/XueYangLee/FriendDemo/blob/master/%E6%9C%8B%E5%8F%8B%E5%9C%88%E7%AE%80%E6%98%93demo.gif)
