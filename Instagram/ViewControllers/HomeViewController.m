//
//  HomeViewController.m
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import "HomeViewController.h"
#import "ComposeViewController.h"
#import "HomeTableCell.h"
#import "DetailViewController.h"
#import "Parse/Parse.h"
#import "Post.h"
#import "DateTools.h"

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate, ComposeViewControllerDelegate>
@property (nonatomic, strong) NSArray *postArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation HomeViewController
- (IBAction)didLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
//        [self dismissViewControllerAnimated:true completion:nil];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.view.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        NSLog(@"tapped logout");
    }];
}

- (void)didPost {
    [self makeQuery];
}


- (void) makeQuery {
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query includeKey:@"author"];
    [query includeKey:@"createdAt"];
    [query includeKey:@"likeCount"];
    [query includeKey:@"commentCount"];
    [query orderByDescending:(@"createdAt")];
    //[query whereKey:@"likesCount" greaterThan:@100];
    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.postArray = posts;
            NSLog(@"refresh makequery triggered");
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    [self.refreshControl endRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    [self onTimer];
    [self makeQuery];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(makeQuery) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    // Do any additional setup after loading the view.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    Post *post = self.postArray[indexPath.row];
    NSLog(@"%@", post[@"text"]);    
    cell.post = post;
    PFUser *user = post[@"author"];
    cell.username.text = [@"@" stringByAppendingString:user[@"username"]];
    if (user != nil) {
        // User found! update username label with username
        cell.username.text = user.username;
    } else {
        // No user found, set default username
        cell.username.text = @"🤖";
    }
    
    cell.likeCount.text = [NSString stringWithFormat:@"%@%s", [cell.post.likeCount stringValue], " likes"];
    cell.commentCount.text = [NSString stringWithFormat:@"%@%s", [cell.post.commentCount stringValue], " comments"];
    if(post.author[@"profileImage"] != nil){
        cell.userImage.file = post.author[@"profileImage"];
        [cell.userImage loadInBackground];
    }
    cell.userImage.layer.cornerRadius = cell.userImage.frame.size.width/2;
    cell.userImage.clipsToBounds = YES;
    
    
    cell.date.text = post.createdAt.shortTimeAgoSinceNow;
    return cell;
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.postArray.count;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"detailsSegue"]){
        HomeTableCell *cell = sender;
        NSIndexPath *path = [self.tableView indexPathForCell:cell];
        Post *dataToPass = self.postArray[path.row];
        DetailViewController *detailVC = [segue destinationViewController];
        detailVC.obj = dataToPass;
    } else if ([segue.identifier isEqualToString:@"composeSegue"]) {
        UINavigationController *nav = [segue destinationViewController];
        ComposeViewController *composeVC = (ComposeViewController *)nav.topViewController;
        composeVC.delegate = self;
    }
}


@end
