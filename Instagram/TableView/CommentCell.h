//
//  CommentCell.h
//  Instagram
//
//  Created by Nancy Wu on 6/28/22.
//

#import <UIKit/UIKit.h>
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface CommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet PFImageView *image;

@end

NS_ASSUME_NONNULL_END
