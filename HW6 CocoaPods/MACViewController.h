//
//  MACViewController.h
//  HW6 CocoaPods
//
//  Created by Macy Aviles on 11/14/13.
//  Copyright (c) 2013 Macy Aviles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MACViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *nameOfCityLabel;
@property (strong, nonatomic) IBOutlet UILabel *tempNowLabel;
@property (strong, nonatomic) IBOutlet UILabel *tempMinLabel;
@property (strong, nonatomic) IBOutlet UILabel *tempMaxLabel;
@property (strong, nonatomic) IBOutlet UILabel *humidityLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (strong, nonatomic) IBOutlet UIButton *loadWeatherButton;

-(IBAction)loadWeatherButtonTapped:(id)sender;

@end
