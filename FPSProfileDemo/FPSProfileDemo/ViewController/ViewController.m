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
#import "XMakeLayoutTableViewCell.h"
#import "XFrameLayoutTableViewCell.h"
#import "XMakeAndFrameTableViewCell.h"
#import "XSubThreadTableViewCell.h"

typedef NS_ENUM (NSInteger, MyCellType) {
    UpdateCellType = 0,
    RemakeCellType,
    MakeCellType,
    MakeAndFrameCellType,
    FrameCellType,
    UserSubThreadCellType
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
    self.cellReuseIdentifier = NSStringFromClass([XUpdateLayoutTableViewCell class]);
    [self registCellForTableView:[XUpdateLayoutTableViewCell class]];
    [self registCellForTableView:[XRemakeLayoutTableViewCell class]];
    [self registCellForTableView:[XMakeLayoutTableViewCell class]];
    [self registCellForTableView:[XFrameLayoutTableViewCell class]];
    [self registCellForTableView:[XMakeAndFrameTableViewCell class]];
    [self registCellForTableView:[XSubThreadTableViewCell class]];
    [self loadData];
}

-(void)registCellForTableView:(Class)class {
    [self.tableView registerClass:class forCellReuseIdentifier:NSStringFromClass(class)];
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
            identifier = NSStringFromClass([XUpdateLayoutTableViewCell class]);
            break;
        case RemakeCellType:
            identifier = NSStringFromClass([XRemakeLayoutTableViewCell class]);
            break;
        case MakeCellType:
            identifier = NSStringFromClass([XMakeLayoutTableViewCell class]);
            break;
        case MakeAndFrameCellType:
            identifier = NSStringFromClass([XMakeAndFrameTableViewCell class]);
            break;
        case FrameCellType:
            identifier = NSStringFromClass([XFrameLayoutTableViewCell class]);
            break;
        case UserSubThreadCellType:
            identifier = NSStringFromClass([XSubThreadTableViewCell class]);
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
