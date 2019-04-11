//
//  SelfCascadeVC.m
//  UIGracefulWriting
//
//  Created by gjfax on 2019/4/11.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "SelfCascadeVC.h"
#import "PickPlaceMenu.h"
#import "FMDatabase.h"
#import "ZFButton.h"
#import "CommonData.h"

#import "YLSTwoPickerView.h"

@interface SelfCascadeVC ()
@property (nonatomic, strong) PickPlaceMenu *pullMenu1;
@property (nonatomic, strong) PickPlaceMenu *pullMenu2;
@property (nonatomic, strong) PickPlaceMenu *pullMenu3;
@property (nonatomic, strong) ZFButton *pickButton1;
@property (nonatomic, strong) ZFButton *pickButton2;
@property (nonatomic, strong) ZFButton *pickButton3;
@end

@implementation SelfCascadeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addPullThreeLevel];
    [self addPullTwoLevel];
    [self addPullOneLevel];
    [self addSheetThreeLevel];
    [self addSheetTwoLevel];
    [self addSheetOneLevel];
}
#pragma mark -  下拉3级联
- (void)addPullThreeLevel {
    NSMutableArray *threeLevelplaceArr =  [CommonData sharedInstance].threeLevelData;
    [self.pullMenu1 configViewWithData:threeLevelplaceArr tabNum:3 inSuperView:self.view];
}
#pragma mark -  下拉2级联
- (void)addPullTwoLevel {
   NSMutableArray *twoLevelplaceArr =  [CommonData sharedInstance].twoLevelData;
    [self.pullMenu2 configViewWithData:twoLevelplaceArr tabNum:2 inSuperView:self.view];
    
}
#pragma mark -  下拉1级联
- (void)addPullOneLevel {
   NSMutableArray *oneLevelplaceArr1 =  [CommonData sharedInstance].oneLevelData;
   [self.pullMenu3 configViewWithData:oneLevelplaceArr1 tabNum:1 inSuperView:self.view];
}
#pragma mark -  弹框3级联
- (void)addSheetThreeLevel {
    [self.pickButton1 addTarget:self action:@selector(addSheetThreeLevelAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)addSheetThreeLevelAction{
    
}
#pragma mark -  弹框2级联
- (void)addSheetTwoLevel {
     [self.pickButton2 addTarget:self action:@selector(addSheetTwoLevelAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)addSheetTwoLevelAction{
    YLSTwoPickerView *picker = [[YLSTwoPickerView alloc]init];
    picker.title = @"请选择行业";
    
    NSArray *array = CommonData.sharedInstance.twoLevelData;
    picker.array = array;
    __block __weak typeof(_pickButton1) blockIickButton1 = _pickButton1;
    picker.pickBlock = ^(NSString * _Nonnull pickString) {
        [blockIickButton1 setTitle:pickString forState:UIControlStateNormal];
    };
    [picker show];
}
#pragma mark -  弹框1级联
- (void)addSheetOneLevel {
     [self.pickButton3 addTarget:self action:@selector(addSheetThreeLevelAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)addSheetOneLevelAction{
    
}
- (PickPlaceMenu *)pullMenu1
{
    if (!_pullMenu1) {
        _pullMenu1 = [[PickPlaceMenu alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40 , 50)];
        [self.view addSubview:_pullMenu1];
    }
    
    return _pullMenu1;
}
- (PickPlaceMenu *)pullMenu2
{
    if (!_pullMenu2) {
        _pullMenu2 = [[PickPlaceMenu alloc] initWithFrame:CGRectMake(20, 80, SCREEN_WIDTH - 40 , 50)];
        [self.view addSubview:_pullMenu2];
    }
    
    return _pullMenu2;
}
- (PickPlaceMenu *)pullMenu3
{
    if (!_pullMenu3) {
        _pullMenu3 = [[PickPlaceMenu alloc] initWithFrame:CGRectMake(20, 140, SCREEN_WIDTH - 40 , 50)];
        [self.view addSubview:_pullMenu3];
    }
    
    return _pullMenu3;
}
- (ZFButton *)pickButton1
{
    if (!_pickButton1) {
        _pickButton1 = [[ZFButton alloc] initWithFrame:CGRectMake(20, 210, SCREEN_WIDTH - 40 , 50)];
        [self commonSettingWithButton:_pickButton1];
        
    }
    
    return _pickButton1;
}
- (ZFButton *)pickButton2
{
    if (!_pickButton2) {
        _pickButton2 = [[ZFButton alloc] initWithFrame:CGRectMake(20, 270, SCREEN_WIDTH - 40 , 50)];
        [self commonSettingWithButton:_pickButton2];
        
    }
    
    return _pickButton2;
}
- (ZFButton *)pickButton3
{
    if (!_pickButton3) {
        _pickButton3 = [[ZFButton alloc] initWithFrame:CGRectMake(20, 330, SCREEN_WIDTH - 40 , 50)];
        [self commonSettingWithButton:_pickButton3];
        
    }
    
    return _pickButton3;
}
- (void)commonSettingWithButton:(ZFButton *)pickButton{
    [pickButton updateButtonStyleWithType:ZFButtonTypeRightImageLeftTitle];
    [pickButton setImage:[UIImage imageNamed:@"login_input_arrow_normal"] forState:UIControlStateNormal];
    [pickButton setImage:[UIImage imageNamed:@"login_input_arrow_click"] forState:UIControlStateSelected];
    [pickButton setViewBorderColor:[UIColor grayColor] radius:3.f border:0.5f];
    [self.view addSubview:pickButton];
}
@end
