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
    [self.photoImageView loadInBackground];
}

- (IBAction)didLike:(id)sender {
//    if(self.post.favorited == NO){
//        self.post.favorited = YES;
//        self.post.likeCount += 1;
//        [self.retweets setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
//        [[APIManager shared] retweet:self.currentTweet completion:^(Tweet *tweet, NSError *error) {
//             if(error){
//                  NSLog(@"Error rting tweet: %@", error.localizedDescription);
//             }
//             else{
//                 NSLog(@"Successfully rted the following Tweet: %@", tweet.text);
//             }
//         }];
//    } else {
//        self.post.favorited = NO;
//        self.post.retweetCount -= 1;
//        [self.retweets setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
//        [[APIManager shared] unretweet:self.currentTweet completion:^(Tweet *tweet, NSError *error) {
//             if(error){
//                  NSLog(@"Error unrting tweet: %@", error.localizedDescription);
//             }
//             else{
//                 NSLog(@"Successfully unrted the following Tweet: %@", tweet.text);
//             }
//         }];
//    }
}
- (IBAction)didComment:(id)sender {
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
