//
//  OLViewController.m
//  Runner
//
//  Created by 牛路伽 on 2023/10/19.
//

#import "OLViewController.h"

@interface OLViewController ()

@end

@implementation OLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray * arrayList = @[@"草草",@"草草1",@"草草2",@"草草3",@"草草4"];
    for (NSString * value in arrayList) {
        NSLog(@"%@", value);
    }
    
    
    NSArray * arrayList1 = @[@"洒大地",@"洒1",@"洒2",@"洒3",@"洒4"];
    for (NSString * value in arrayList1) {
        NSLog(@"嗷嗷: %@", value);
    }
    
    for (NSString * value in arrayList1) {
        NSLog(@"121332323: %@", value);
    }
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
