//
//  ProfileViewController.m
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import "ProfileViewController.h"
#import "InstaUser.h"

@interface ProfileViewController ()
@property (nonatomic, strong) InstaUser *currentUser;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.currentUser = InstaUser.currentUser;
    NSLog(@"%@", self.currentUser.username);
    self.username.text = self.currentUser.username;
    self.name.text = self.currentUser.name;
    self.bio.text = self.currentUser.bio;
    
    //self.data = self.currentUser.profileImage.getData();
    if(self.currentUser.profileImage != nil){
        self.profileImage.file = self.currentUser.profileImage;
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
