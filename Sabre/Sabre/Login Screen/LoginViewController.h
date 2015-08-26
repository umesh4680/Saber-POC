//
//  ViewController.h
//  Sabre
//
//  Created by Suraj on 22/04/15.
//  Copyright (c) 2015 Suraj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageTableViewController.h"
#import "AlertViewController.h"
#import "AlertListTableViewController.h"

@interface LoginViewController : UIViewController <UINavigationControllerDelegate>
{
    
    MessageTableViewController *msgVC;
    AlertListTableViewController *alertVC;
    AlertListTableViewController *alertListVC;
}

@property (weak, nonatomic) IBOutlet UIScrollView *containerScrollView;
@property (strong,nonatomic) UINavigationController *navControllerForMessage;
@property (strong,nonatomic) UINavigationController *navControllerForAlert;

@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

- (IBAction)messageMenuClicked:(id)sender;

- (IBAction)AlertMenuClicked:(id)sender;

- (IBAction)logoutButtonClicked:(id)sender;

@end

