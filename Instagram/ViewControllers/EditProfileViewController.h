//
//  EditProfileViewController.h
//  Instagram
//
//  Created by Nancy Wu on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "InstaUser.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN
@protocol EditProfileViewDelegate
- (void)didEdit;
@end

@interface EditProfileViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, weak) id<EditProfileViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet PFImageView *profileImage;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *bioField;

@end

NS_ASSUME_NONNULL_END
