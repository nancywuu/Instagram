//
//  InstaUser.m
//  Instagram
//
//  Created by Nancy Wu on 6/28/22.
//

#import "InstaUser.h"

@implementation InstaUser

@dynamic username;
@dynamic password;
@dynamic profileImage;
@dynamic name;
@dynamic bio;

+ (void) updateUser: ( UIImage * _Nullable )image withName: ( NSString * _Nullable )name withUsername: ( NSString * _Nullable )username withBio: (NSString * _Nullable)bio withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    InstaUser *user = InstaUser.currentUser;
    if(image.size.width != 0){
        user[@"profileImage"] = [self getPFFileFromImage:image];
    }
    if(![username isEqualToString:@""]){
        user.username = username;
    }
    if(![name isEqualToString:@""]){
        user.name = name;
    }
    if(![bio isEqualToString:@""]){
        user.bio = bio;
    }

    [user saveInBackgroundWithBlock: completion];
}

+ (PFFileObject * )getPFFileFromImage: (UIImage * _Nullable)image {
 
    // check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:@"image.png" data:imageData];
}

@end
