//
//  ViewController.m
//  iMustache
//
//  Created by Ivelin Ivanov on 9/3/13.
//  Copyright (c) 2013 MentorMate. All rights reserved.
//

#import "CameraViewController.h"
#import "OverlayViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    picker.navigationBarHidden = YES;
    picker.toolbarHidden = YES;
    
    self.overlay = [[OverlayViewController alloc] initWithNibName:@"OverlayViewController" bundle:nil];

    picker.cameraOverlayView = self.overlay.view;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)sharePicture:(id)sender
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(self.imageView.bounds.size);
    
    [self.imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSArray *activityItems = @[image];
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
    
}

#pragma mark - UIImagePicker delegate methods

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = chosenImage;
    
    [self.imageView addSubview:self.overlay.view];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
