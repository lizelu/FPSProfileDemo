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
#import "XRemakeLayoutTableViewCell.h"

#define UpdateCellReuseIdentifer @"XUpdateLayoutTableViewCell"
#define RemakeCellReuseIdentifer @"XRemakeLayoutTableViewCell"
#define MakeCellReuseIdentifer @"XUpdateLayoutTableViewCell"
#define FrameCellReuseIdentifer @"XUpdateLayoutTableViewCell"

typedef NS_ENUM (NSInteger, MyCellType) {
    UpdateCellType = 0,
    RemakeCellType,
    MakeCellType,
    FrameCellType
};

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISegmentedControl *layoutSegmentControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) XViewModel *viewModel;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (strong, nonatomic) NSString *cellReuseIdentifier;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[NSMutableArray alloc] init];
    self.viewModel = [[XViewModel alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.cellReuseIdentifier = UpdateCellReuseIdentifer;
    [self.tableView registerClass:[XUpdateLayoutTableViewCell class] forCellReuseIdentifier:UpdateCellReuseIdentifer];
    [self.tableView registerClass:[XRemakeLayoutTableViewCell class] forCellReuseIdentifier:RemakeCellReuseIdentifer];
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

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (IBAction)tapSegmentControl:(UISegmentedControl *)sender {
    NSString *identifier;
    switch (sender.selectedSegmentIndex) {
        case UpdateCellType:
            identifier = UpdateCellReuseIdentifer;
            break;
        case RemakeCellType:
            identifier = RemakeCellReuseIdentifer;
            break;
        case MakeCellType:
            identifier = MakeCellReuseIdentifer;
            break;
        case FrameCellType:
            identifier = FrameCellReuseIdentifer;
            break;
    }
    self.cellReuseIdentifier = identifier;
    [self.tableView reloadData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    XBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: self.cellReuseIdentifier];
    [cell setCellInfo:self.dataSource[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 215;
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.bounds.size.height)) {
         [self loadData];
    }
}

@end
