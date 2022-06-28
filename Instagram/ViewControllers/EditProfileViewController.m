//
//  EditProfileViewController.m
//  Instagram
//
//  Created by Nancy Wu on 6/28/22.
//

#import "EditProfileViewController.h"
#import "InstaUser.h"

@interface EditProfileViewController () <UITextFieldDelegate>

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.usernameField.delegate = self;
    self.nameField.delegate = self;
    self.bioField.delegate = self;
    // Do any additional setup after loading the view.
}
- (IBAction)didClickDone:(id)sender {
    [InstaUser updateUser:self.profileImage.image withName:self.nameField.text withUsername:self.usernameField.text withBio:self.bioField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if(error){
              NSLog(@"Error posting: %@", error.localizedDescription);
         }
         else{
             NSLog(@"Successfully updated profile with name: %@", self.nameField.text);
             [self dismissViewControllerAnimated:true completion:nil];
         }
    }];
}
- (IBAction)changePic:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    if(editedImage != nil){
        CGFloat width = self.profileImage.bounds.size.width * 3;
        CGFloat height = self.profileImage.bounds.size.height * 3;
        CGSize newSize = CGSizeMake(width, height);
        UIImage *editedImage2 = [self resizeImage:editedImage withSize:newSize];

        [self.profileImage setImage:editedImage2];
    } else {
        //[self.chosenImage setImage:originalImage];
//        [self.chosenImage setImage:originalImage];
          [self.profileImage setImage:originalImage];
    }

    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
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
