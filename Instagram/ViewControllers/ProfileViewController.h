//
//  ProfileViewController.h
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import <UIKit/UIKit.h>
#import "InstaUser.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet PFImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *bio;
@property (weak, nonatomic) IBOutlet UICollectionView *collectView;
@property (nonatomic, strong) InstaUser *currentUser;
@property BOOL isFromTimeline;

@end

NS_ASSUME_NONNULL_END
