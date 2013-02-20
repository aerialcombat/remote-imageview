//
//  ViewController.h
//  MNMRemoteImageView
//
//  Created by Mario Negro on 05/02/13.
//  Copyright (c) 2013 Mario Negro. All rights reserved.
//

#import "DJRemoteButton.h"

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet DJRemoteButton *remoteButton;
- (IBAction)loadRemoteButtonPressed:(id)sender;

- (IBAction)remoteButtonPressed:(id)sender;

@end
