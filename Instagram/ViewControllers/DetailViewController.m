//
//  DetailViewController.m
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import "DetailViewController.h"
#import "DateTools.h"
@import Parse;

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet PFImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *caption;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFUser *temp = self.obj[@"author"];
    self.username.text = [@"@" stringByAppendingString:temp[@"username"]];
    
    //cell.photoImageView.file = pfobj[@"image"];
    self.image.file = self.obj.image;
    self.date.text = self.obj.createdAt.shortTimeAgoSinceNow;
    self.caption.text = self.obj.caption;
    
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
