//
//  ViewController.m
//  Sabre
//
//  Created by Suraj on 22/04/15.
//  Copyright (c) 2015 Suraj. All rights reserved.
//

#import "LoginViewController.h"
#import "MessageTableViewController.h"
#import "AlertViewController.h"

@interface LoginViewController () {
    __weak IBOutlet UIView *viewTopHeader;
    __weak IBOutlet UIView *viewTopHeaderSeparatorRedLine;
    __weak IBOutlet UITextField *txtFieldUserName;
    __weak IBOutlet UITextField *txtFieldPassword;
    __weak IBOutlet UIButton *btnLogin;
    __weak IBOutlet UIButton *btnForgotPassword;
    __weak IBOutlet UIButton *btnVisitWebsite;
}

- (IBAction)loginToApp:(id)sender;
- (IBAction)navigateToForgotPswdScreen:(id)sender;
- (IBAction)navigateToWebsite:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    msgVC = [MessageTableViewController new];
    alertVC = [AlertListTableViewController new];
    
    //[self addChildViewController:alertVC];
    
    self.navControllerForMessage= [[UINavigationController alloc]initWithRootViewController:msgVC];
    [self addChildViewController:self.navControllerForMessage];
    [self.containerScrollView addSubview:self.navControllerForMessage.view];
    
    
    self.navControllerForAlert= [[UINavigationController alloc]initWithRootViewController:alertVC];
    [self addChildViewController:self.navControllerForAlert];


    [self.navControllerForAlert setNavigationBarHidden:TRUE];
    [self.navControllerForMessage setNavigationBarHidden:TRUE];
    
    self.navControllerForMessage.delegate = self;
    

    [self setUserInterface];
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    NSLog(@"%@",viewController.class);
    
    if (![viewController isKindOfClass: msgVC.class])
    {
        [self.logoutButton setTitle:@"back" forState:UIControlStateNormal];
        
    }else{
        [self.logoutButton setTitle:@"Logout" forState:UIControlStateNormal];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUserInterface {
    
    
    [viewTopHeader setBackgroundColor:[UIColor colorWithHexString:@"#373f4a"]];
    [viewTopHeaderSeparatorRedLine setBackgroundColor:[UIColor colorWithHexString:@"#E81F26"]];
    [txtFieldUserName setBackgroundColor:[UIColor colorWithHexString:@"#f2f2f2"]];
    [txtFieldPassword setBackgroundColor:[UIColor colorWithHexString:@"#f2f2f2"]];
    [btnLogin setBackgroundColor:[UIColor colorWithHexString:@"#E61F26"]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
}

- (IBAction)loginToApp:(id)sender {
}

- (IBAction)navigateToForgotPswdScreen:(id)sender {
}

- (IBAction)navigateToWebsite:(id)sender {
}

/*
- (IBAction)messageMenuClicked:(id)sender {
    
    if (alertVC)
    {
        [alertVC removeFromParentViewController];
        [msgVC removeFromParentViewController];
    }
    
    msgVC = [[MessageTableViewController alloc]init];
    [self.containerScrollView addSubview:msgVC.view];
    
}

- (IBAction)AlertMenuClicked:(id)sender {
    
    if (msgVC)
    {
        [msgVC removeFromParentViewController];
        [alertListVC removeFromParentViewController];
    }
     
    alertListVC =[[AlertListTableViewController alloc]init];
    [self.containerScrollView addSubview:alertListVC.view];
}
 
 */




- (IBAction)messageMenuClicked:(id)sender {
    
    [self.navControllerForAlert.view  removeFromSuperview];
    [self.navControllerForMessage popToRootViewControllerAnimated:YES];
    [self.containerScrollView addSubview:self.navControllerForMessage.view];
    
}


- (IBAction)AlertMenuClicked:(id)sender {
    
    [self.navControllerForMessage.view  removeFromSuperview];
    [self.navControllerForMessage popToRootViewControllerAnimated:YES];
    [self.containerScrollView addSubview:self.navControllerForAlert.view];

}

- (IBAction)logoutButtonClicked:(id)sender {
    
    [self.navControllerForMessage popViewControllerAnimated:YES];
    
}

 
@end
