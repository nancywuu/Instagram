//
//  InstaUser.h
//  Instagram
//
//  Created by Nancy Wu on 6/28/22.
//

#import <Parse/Parse.h>
#import <Foundation/Foundation.h>
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface InstaUser : PFUser<PFSubclassing>

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, strong) PFFileObject *profileImage;


+ (void) updateUser: ( UIImage * _Nullable )image withName: ( NSString * _Nullable )name withUsername: ( NSString * _Nullable )username withBio: (NSString * _Nullable)bio withCompletion: (PFBooleanResultBlock  _Nullable)completion;

@end

NS_ASSUME_NONNULL_END
