//
//  CollectionReusableView.h
//  codeChallenge
//
//  Created by Sabih Tahir on 01/02/2022.
//  Copyright © 2022 Fernando Suárez. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FlickrListHeaderDelegate <NSObject>
- (void)clickSort:(NSString*)sort;
@end
@interface FlickrListHeader : UITableViewHeaderFooterView
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (nonatomic, weak) id <FlickrListHeaderDelegate> delegate;
-(IBAction)clickDateToggle:(UISegmentedControl*)sender;
@end

NS_ASSUME_NONNULL_END
