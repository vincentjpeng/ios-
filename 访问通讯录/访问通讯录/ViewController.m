//
//  ViewController.m
//  访问通讯录
//
//  Created by VincentPeng on 2018/9/6.
//  Copyright © 2018年 VincentPeng. All rights reserved.
//

#import "ViewController.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@interface ViewController ()<CNContactPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self openContact];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)openContact{
    // 1.创建通讯录界面（自带系统UI界面）
    CNContactPickerViewController *picketVC = [[CNContactPickerViewController alloc] init]; // 真机或者模拟器的系统版本必须是9.0以上

    // 2.遵守代理 CNContactPickerDelegate
    picketVC.delegate = self;
    
    // （1）picketVC.displayedPropertyKeys属性 进入联系人详情界面时需要展示的信息（必须在展示界面之前设置）， displayedPropertyKeys不设置的话，会展示所有信息，如果设置的话，则只会根据数组中的信息进行展示，但是这个属性只适用于单选的状态，多选状态下不起作用。
    //    picketVC.displayedPropertyKeys = @[CNContactGivenNameKey,CNContactPhoneNumbersKey,CNContactEmailAddressesKey];
    
    // （2）picketVC.predicateForSelectionOfContact属性 用于控制联系人选中后的操作
    //    picketVC.predicateForSelectionOfContact = [NSPredicate predicateWithFormat:@"emailAddresses.@count == 1"];
    
    // （3）picketVC.predicateForSelectionOfContact属性 用于控制联系人属性选中后的操作
    //    picketVC.predicateForSelectionOfProperty = [NSPredicate predicateWithFormat:@"(key == 'emailAddresses') AND (value LIKE '*@mac.com')"]; // 也可以是@qq.com
    
    // （4）picketVC.predicateForEnablingContact属性 用于控制联系人是否可以选择,如果不设置，默认所有的联系人都是可以交互的（可选中）,如果设置了并且命中，则联系人不可交互，不命中的话，可以交互。此属性在多选和单选情况下都起作用
    //    picketVC.predicateForEnablingContact = [NSPredicate predicateWithFormat:@"emailAddresses.@count > 0"];
    
    // 3.展现通讯录界面
    [self presentViewController:picketVC animated:YES completion:nil];
}
#pragma mark --CNContactPickerDelegate

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty{
 //点击事件
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
