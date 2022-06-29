//
//  ProfileViewController.m
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import "ProfileViewController.h"
#import "EditProfileViewController.h"
#import "DetailViewController.h"
#import "InstaUser.h"
#import "GridCell.h"
#import "Post.h"

@interface ProfileViewController () <UICollectionViewDataSource, EditProfileViewDelegate>
@property (nonatomic, strong) InstaUser *currentUser;
@property (nonatomic, strong) NSArray *postArray;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.currentUser = InstaUser.currentUser;
    self.collectView.dataSource = self;
    NSLog(@"%@", self.currentUser.username);

    [self fetchProfile];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchProfile) forControlEvents:UIControlEventValueChanged];
    [self.collectView insertSubview:self.refreshControl atIndex:0];
}

- (void)fetchProfile {
    self.username.text = self.currentUser.username;
    self.name.text = self.currentUser.name;
    self.bio.text = self.currentUser.bio;

    //self.data = self.currentUser.profileImage.getData();
    if(self.currentUser.profileImage != nil){
        self.profileImage.file = self.currentUser.profileImage;
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width/2;
        self.profileImage.clipsToBounds = YES;
        [self.profileImage loadInBackground];
    }
    
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query includeKey:@"author"];
    [query includeKey:@"createdAt"];
    [query orderByDescending:(@"createdAt")];
    [query whereKey:@"author" equalTo: [PFUser currentUser]];
    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.postArray = posts;
            NSLog(@"refresh makequery triggered");
            [self.collectView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    [self.refreshControl endRefreshing];
}

- (void) didEdit {
    [self fetchProfile];
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"ahhh collect cell");
    GridCell *cell = [self.collectView dequeueReusableCellWithReuseIdentifier:@"gridCell" forIndexPath:indexPath];
    cell.previewImage.file = self.postArray[indexPath.row][@"image"];
    
    cell.post = self.postArray[indexPath.row];
    [cell.previewImage loadInBackground];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.postArray.count;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"gridDetailSegue"]){
        GridCell *cell = sender;
        NSIndexPath *path = [self.collectView indexPathForCell:cell];
        Post *dataToPass = self.postArray[path.row];
        DetailViewController *detailVC = [segue destinationViewController];
        detailVC.obj = dataToPass;
    } else if ([segue.identifier isEqualToString:@"editSegue"]){
        EditProfileViewController *editVC = [segue destinationViewController];
        editVC.delegate = self;
    }
}

@end
