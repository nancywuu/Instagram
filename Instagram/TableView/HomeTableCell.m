//
//  HomeTableCell.m
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import "HomeTableCell.h"

@implementation HomeTableCell

- (void)setPost:(Post *)post {
    _post = post;
    self.caption.text = post[@"caption"];
    self.photoImageView.file = post[@"image"];
    self.liked = NO;
    [self.photoImageView loadInBackground];
}

- (IBAction)didLike:(id)sender {
    if(self.liked == YES){
        self.liked = NO;
        int temp = [self.post.likeCount intValue];
        self.post.likeCount = [NSNumber numberWithInt:temp - 1];
        [self.like setImage:[UIImage systemImageNamed:@"heart"] forState:UIControlStateNormal];
        self.likeCount.text = [NSString stringWithFormat:@"%@%s", [self.post.likeCount stringValue], " likes"];
        [Post favorite:self.post withValue:self.post.likeCount withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
            if(error){
                  NSLog(@"Error posting: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully updated like count: %@", self.post.likeCount);
                 [self.delegate didLike];
                 //[self.navigationController popViewControllerAnimated:YES];
             }
        }];
    } else {
        self.liked = YES;
        int temp = [self.post.likeCount intValue];
        self.post.likeCount = [NSNumber numberWithInt:temp + 1];
        [self.like setImage:[UIImage systemImageNamed:@"heart.fill"] forState:UIControlStateNormal];
        self.likeCount.text = [NSString stringWithFormat:@"%@%s", [self.post.likeCount stringValue], " likes"];
        [Post favorite:self.post withValue:self.post.likeCount withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
            if(error){
                  NSLog(@"Error posting: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully updated like count: %@", self.post.likeCount);
                 [self.delegate didLike];
                 //[self.navigationController popViewControllerAnimated:YES];
             }
        }];
    }
}

- (void) didTapUserProfile:(UITapGestureRecognizer *)sender{
    //TODO: Call method delegate
    NSLog(@"TAPPED user profile");
    [self.delegate homeTableCell:self didTap:self.post.author];
}


- (IBAction)didComment:(id)sender {
    [Comment postComment:self.post.objectId withUser:PFUser.currentUser.username withText:@"tester!" withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if(error){
              NSLog(@"Error posting: %@", error.localizedDescription);
         }
         else{
             //[self.delegate didPost];
             NSLog(@"Successfully commented on post: %@", self.post.postID);
             //[self dismissViewControllerAnimated:true completion:nil];
         }
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UITapGestureRecognizer *profileTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapUserProfile:)];
    [self.userImage addGestureRecognizer:profileTapGestureRecognizer];
    [self.userImage setUserInteractionEnabled:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
