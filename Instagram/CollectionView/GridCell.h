//
//  GridCell.h
//  Instagram
//
//  Created by Nancy Wu on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface GridCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PFImageView *previewImage;
@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
