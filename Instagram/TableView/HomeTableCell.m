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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
