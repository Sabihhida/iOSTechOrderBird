//
//  CustomCell.m
//  codeChallenge
//
//  Created by Nano Suarez on 18/04/2018.
//  Copyright © 2018 Fernando Suárez. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
-(void)setData:(NSDictionary*)photo {
    self.imageTitleCell.text = [photo objectForKey:@"title"];
    self.imageSubtitleCell.text = [[photo objectForKey:@"description"] objectForKey:@"_content"];;
    [self.imageCell imageFromServerURLWithUrlString:[photo objectForKey:@"url_t"] PlaceHolderImage:[UIImage imageNamed:@"defaultPhoto"] completion:^(UIImage * _Nonnull image) {
        self.imageCell.image = image;
    }];
}

@end
