//
//  ComposeViewController.h
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComposeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *captionField;

@end

NS_ASSUME_NONNULL_END
