//
//  CollectionReusableView.m
//  codeChallenge
//
//  Created by Sabih Tahir on 01/02/2022.
//  Copyright © 2022 Fernando Suárez. All rights reserved.
//

#import "FlickrListHeader.h"


@implementation FlickrListHeader

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(IBAction)clickDateToggle:(UISegmentedControl*)sender {
    NSString *sorted = @"";
    NSLog(@"%ld",(long)sender.selectedSegmentIndex);;
    switch (sender.selectedSegmentIndex) {
        case 0:
            sorted = @"date-posted-asc";
            break;
        case 1:
            sorted = @"date-posted-desc";
            break;
        default:
            break;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickSort:)]) {
        [self.delegate clickSort:sorted];
    }
}
@end
