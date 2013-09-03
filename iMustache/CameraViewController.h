//
//  ViewController.h
//  iMustache
//
//  Created by Ivelin Ivanov on 9/3/13.
//  Copyright (c) 2013 MentorMate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OverlayViewController.h"

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) OverlayViewController *overlay;

- (IBAction)takePicture:(id)sender;
- (IBAction)sharePicture:(id)sender;

@end
