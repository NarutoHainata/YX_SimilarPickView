//
//  MainTableViewController.m
//  YX_SimilarPickView
//
//  Created by yang on 16/8/2.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)UIButton *bgcBtn;

@property(nonatomic, strong) UIButton *confir;
@property(nonatomic, strong) UIButton *cancle;

@property(nonatomic) NSInteger num;
@end

@implementation MainTableViewController

-(UITableView *)tableView{
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 135) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor lightGrayColor];
        _tableView.layer.cornerRadius = 10;
        
        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [_tableView selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    return _tableView;
}
-(UIButton *)bgcBtn{
    
    if (_bgcBtn == nil) {
        _bgcBtn = [[UIButton alloc]initWithFrame:self.view.frame];
        _bgcBtn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        [_bgcBtn addTarget:self action:@selector(bgcBtnClick) forControlEvents:UIControlEventTouchUpInside];

    }
    return _bgcBtn;
}
-(UIButton *)confir{
    
    if (_confir == nil) {
        _confir = [[UIButton alloc]initWithFrame:CGRectMake(20, 245, self.view.frame.size.width-40, 40)];
        _confir.backgroundColor = [UIColor whiteColor];
        _confir.layer.cornerRadius = 3;
        [_confir setTitle:@"确定" forState:UIControlStateNormal];
        [_confir setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_confir addTarget:self action:@selector(confirBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _confir;
}
-(UIButton *)cancle{
    
    if (_cancle == nil) {
        _cancle = [[UIButton alloc]initWithFrame:CGRectMake(20, 290, self.view.frame.size.width-40, 40)];
        _cancle.backgroundColor = [UIColor whiteColor];
        [_cancle setTitle:@"取消" forState:UIControlStateNormal];
        [_cancle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cancle.layer.cornerRadius = 3;
        [_cancle addTarget:self action:@selector(cancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _cancle;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(clcik)];
    [self.view addGestureRecognizer:pan];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = @"123";
    
    return cell;
}
-(void)clcik{
    
        [self.view addSubview:self.bgcBtn];
    
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.01f)];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.confir];
    [self.view addSubview:self.cancle];
    
}
-(void)bgcBtnClick{
    [self.tableView removeFromSuperview];
    [self.bgcBtn removeFromSuperview];
    [self.confir removeFromSuperview];
    [self.cancle removeFromSuperview];

}
-(void)confirBtnClick{

    NSLog(@"%d",_num);
    [self.tableView removeFromSuperview];
    [self.bgcBtn removeFromSuperview];
    [self.confir removeFromSuperview];
    [self.cancle removeFromSuperview];

    
}
-(void)cancleBtnClick{
    
    [self.tableView removeFromSuperview];
    [self.bgcBtn removeFromSuperview];
    [self.confir removeFromSuperview];
    [self.cancle removeFromSuperview];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self clcik];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _num = indexPath.row;
    NSLog(@"%d",indexPath.row);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
