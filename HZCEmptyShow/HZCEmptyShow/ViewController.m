//
//  ViewController.m
//  HZCEmptyShow
//
//  Created by Apple on 2017/8/9.
//  Copyright © 2017年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "ViewController.h"
#import "HZCEmptyShowView.h"

@interface ViewController ()<UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [NSMutableArray array];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    _tableView.dataSource = self;
    _tableView.separatorStyle = NO;
    [self.view addSubview:_tableView];

    __weak typeof(self)weakSelf = self;

    
    [HZCEmptyShowView showEmptyViewWithImageName:nil tipString:nil buttonString:nil targetVC:self callBack:^{
        [weakSelf.dataArray addObjectsFromArray:@[@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text"]];
        [weakSelf.tableView reloadData];
    }];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

- (void)demo {
    __weak typeof(self)weakSelf = self;
        HZCEmptyShowView *showView = [[HZCEmptyShowView alloc]initWithFrame:self.view.bounds];
    __weak typeof(showView)weakShowView = showView;
        [self.view addSubview:showView];
        showView.tipString = @"没数据";
//        showView.imageName = @"netError";
        showView.buttonString = @"再来一次";
//        showView.hiddenLoadButton = YES;
//        showView.hiddenImageView = YES;
        showView.callBack = ^{
            weakShowView.hidden = YES;
            [weakSelf.dataArray addObjectsFromArray:@[@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text",@"text"]];
            [weakSelf.tableView reloadData];
        };
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
