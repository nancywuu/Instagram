//
//  HomeViewController.m
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import "HomeViewController.h"
#import "Parse/Parse.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
- (IBAction)didLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        [self dismissViewControllerAnimated:true completion:nil];
        NSLog(@"tapped logout");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
