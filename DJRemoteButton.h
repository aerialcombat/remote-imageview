//
//  DJRemoteButton.h
//  MNMRemoteImageView
//
//  Created by DJ Kim on 2/20/13.
//  Copyright (c) 2013 Mario Negro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJRemoteButton : UIButton

@property (nonatomic, readwrite, copy) NSString *url;

/*
 * Activity indicator to be shown while image is downloaded
 */
@property (nonatomic, readwrite, strong) UIActivityIndicatorView *activityIndicator;

- (void)displayImageFromURL:(NSString *)url
          completionHandler:(void(^)(NSError *error))completionBlock;

@end
