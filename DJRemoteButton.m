//
//  DJRemoteButton.m
//  MNMRemoteImageView
//
//  Created by DJ Kim on 2/20/13.
//  Copyright (c) 2013 Mario Negro. All rights reserved.
//

#import "DJRemoteButton.h"

@implementation DJRemoteButton


- (void)initializeControl {
    
    if (self) {
        
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_activityIndicator setHidesWhenStopped:YES];
        [_activityIndicator setCenter:CGPointMake(CGRectGetMidX([self bounds]), CGRectGetMidY([self bounds]))];
        [_activityIndicator setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin];
        [self addSubview:_activityIndicator];
    }
}

/*
 * Designated initalizer
 */
- (id)init {
    
    if (self = [super init]) {
        
        [self initializeControl];
    }
    
    return self;
}

/*
 * Returns an object initialized from data in a given unarchiver. (required)
 */
- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        
        [self initializeControl];
    }
    
    return self;
}

/*
 * Initializes and returns a newly allocated view object with the specified frame rectangle.
 */
- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self initializeControl];
    }
    
    return self;
}

/*
 * Returns an image view initialized with the specified image.
 */


/*
 * Returns an image view initialized with the specified regular and highlighted images.
 */
/*
- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    
    //if (self = [super initWithImage:image highlightedImage:highlightedImage]) {
    if (self = [super initWithImage:image highlightedImage:highlightedImage]) {    
        [self initializeControl];
    }
    
    return self;
}*/

#pragma mark - Visuals

/*
 * Downloads and displays the image from the given URL.
 */
- (void)displayImageFromURL:(NSString *)url
          completionHandler:(void(^)(NSError *error))completionBlock {
    
    if ([url length] > 0 && ![_url isEqualToString:url]) {
        
        //[self setImage:nil];
        [self setImage:nil forState:UIControlStateNormal];
        _url = [url copy];
        [_activityIndicator startAnimating];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
            UIImage *image = [UIImage imageWithData:imageData];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSError *error = nil;
                [_activityIndicator stopAnimating];
                
                if (image != nil) {
                    
                    //[self setImage:image];
                    [self setImage:image forState:UIControlStateNormal];
                    
                } else {
                    
                    error = [NSError errorWithDomain:@"com.marionegro.remoteimageview"
                                                code:-1
                                            userInfo:@{ NSLocalizedDescriptionKey : [NSString stringWithFormat:@"Cannot download image from '%@'", _url] }];
                }
                
                completionBlock(error);
            });
        });
    }
}


@end
