//
//  ViewController.m
//  FSPProfileDemo
//
//  Created by lizelu on 2017/10/28.
//  Copyright © 2017年 Mr.ZeluLi. All rights reserved.
//

#import "ViewController.h"
#import "XViewModel.h"
#import "XBaseTableViewCell.h"
#import "XUpdateLayoutTableViewCell.h"

#define UpdateCellReuseIdentifer @"XUpdateLayoutTableViewCell"

typedef NS_ENUM (NSInteger, MyCellType) {
    UpdateCellType = 0
};

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISegmentedControl *layoutSegmentControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) XViewModel *viewModel;
@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[NSMutableArray alloc] init];
    self.viewModel = [[XViewModel alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[XUpdateLayoutTableViewCell class] forCellReuseIdentifier:UpdateCellReuseIdentifer];
    [self loadData];
}
-(void)loadData {
    __weak typeof(self) weak_self = self;
    [self.viewModel requestData:^(NSArray *requestData) {
        [weak_self.dataSource addObjectsFromArray:requestData];
        [weak_self.tableView reloadData];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    XBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UpdateCellReuseIdentifer];
    [cell setCellInfo:self.dataSource[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 215;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.bounds.size.height)) {
         [self loadData];
    }
}





@end
