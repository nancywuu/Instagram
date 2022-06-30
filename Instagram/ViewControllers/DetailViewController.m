//
//  DetailViewController.m
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import "DetailViewController.h"
#import "DateTools.h"
#import "Comment.h"
#import "CommentCell.h"
@import Parse;

@interface DetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet PFImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet PFImageView *profilePic;
@property (weak, nonatomic) IBOutlet UIButton *like;
@property (weak, nonatomic) IBOutlet UITextField *commentField;

@property (nonatomic, strong) NSArray *commentArray;
@property (nonatomic, strong) UIRefreshControl *refreshControl;


@end

@implementation DetailViewController
- (IBAction)didLike:(id)sender {
}
- (IBAction)didComment:(id)sender {
    if(![self.commentField.text isEqualToString:@""]){
        [Comment postComment:self.obj.objectId withUser:InstaUser.currentUser withText:self.commentField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
            if(error){
                  NSLog(@"Error posting: %@", error.localizedDescription);
             }
             else{
                 //[self.delegate didPost];
                 NSLog(@"Successfully commented on post: %@", self.commentField.text);
                 //[self dismissViewControllerAnimated:true completion:nil];
                 [self fetchComments];
                 
                 int temp = [self.obj.commentCount intValue];
                 self.obj.commentCount = [NSNumber numberWithInt:temp + 1];
                 [Post comment:self.obj withValue:self.obj.commentCount withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
                     if(error){
                           NSLog(@"Error posting: %@", error.localizedDescription);
                      }
                      else{
                          NSLog(@"Successfully updated comment count: %@", self.obj.commentCount);
                      }
                 }];
             }
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFUser *temp = self.obj[@"author"];
    self.username.text = [@"@" stringByAppendingString:temp[@"username"]];
    
    //cell.photoImageView.file = pfobj[@"image"];
    self.image.file = self.obj.image;
    self.date.text = self.obj.createdAt.shortTimeAgoSinceNow;
    self.caption.text = self.obj.caption;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    int intv = [self.obj.likeCount intValue];
    if(intv == 1){
        self.likeCount.text = [NSString stringWithFormat:@"%@%s", [self.obj.likeCount stringValue], " like"];
    } else {
        self.likeCount.text = [NSString stringWithFormat:@"%@%s", [self.obj.likeCount stringValue], " likes"];
    }
    
    if(self.liked == YES){
        [self.like setImage:[UIImage systemImageNamed:@"heart.fill"] forState:UIControlStateNormal];
    } else {
        [self.like setImage:[UIImage systemImageNamed:@"heart"] forState:UIControlStateNormal];
    }
    
    [self fetchComments];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchComments) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
}

- (void)fetchComments {
    PFQuery *query = [PFQuery queryWithClassName:@"Comment"];
    [query includeKey:@"postID"];
    [query includeKey:@"createdAt"];
    [query includeKey:@"author"];
    [query orderByDescending:(@"createdAt")];
    [query whereKey:@"postID" equalTo: self.obj.objectId];
    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *comments, NSError *error) {
        if (comments != nil) {
            self.commentArray = comments;
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    [self.refreshControl endRefreshing];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell" forIndexPath:indexPath];
    NSLog(@"comment found");
    Comment *comment = self.commentArray[indexPath.row];
    cell.username.text = comment.author.username;
    cell.caption.text = comment.text;
    if(comment.author.profileImage != nil){
        cell.image.file = comment.author.profileImage;
        cell.image.layer.cornerRadius = cell.image.frame.size.width/2;
        cell.image.clipsToBounds = YES;
        [cell.image loadInBackground];
    }
    
    return cell;
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.commentArray.count;
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
