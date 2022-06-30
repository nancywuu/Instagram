//
//  HomeTableCell.h
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Comment.h"
#import "InstaUser.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN
@protocol HomeCellDelegate;

@interface HomeTableCell : UITableViewCell
@property (nonatomic, weak) id<HomeCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (nonatomic, strong) Post *post;
@property (strong, nonatomic) IBOutlet PFImageView *photoImageView;
@property (weak, nonatomic) IBOutlet PFImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet UIButton *comment;
@property (weak, nonatomic) IBOutlet UIButton *like;
@property (nonatomic) BOOL *liked;

- (void)didLike;

@end

@protocol HomeCellDelegate
- (void)didLike;
- (void)homeTableCell:(HomeTableCell *) cell didTap: (PFUser *)user;
@end

NS_ASSUME_NONNULL_END
