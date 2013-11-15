//
//  MACViewController.m
//  HW6 CocoaPods
//
//  Created by Macy Aviles on 11/14/13.
//  Copyright (c) 2013 Macy Aviles. All rights reserved.
//

#import "MACViewController.h"
#import "JSONKit/JSONKit.h"


@interface MACViewController () <NSURLSessionDataDelegate>

@end

@implementation MACViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self loadWeatherData];
    
    [[NSOperationQueue mainQueue] setMaxConcurrentOperationCount:1];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadWeatherButtonTapped:(id)sender
{
    [self loadWeatherData];
}


- (void)loadWeatherData
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration
                                                          delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURL *dataUrl = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Seattle,us"];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:dataUrl
                                      completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                          [self refreshViewWeatherData:data];
                                      }];
    [dataTask resume];
}

- (void)refreshViewWeatherData:(NSData *)data
{
    NSDictionary *cityDict = [data objectFromJSONData];
    
    NSString *nameOfCity = [cityDict objectForKey:@"name"];
    NSNumber *tempNow = [cityDict valueForKeyPath:@"main.temp"];
    NSNumber *tempMin = [cityDict valueForKeyPath:@"main.temp_min"];
    NSNumber *tempMax = [cityDict valueForKeyPath:@"main.temp_max"];
    NSNumber *cityHumidity = [cityDict valueForKeyPath:@"main.humidity"];
    NSString *descriptionOfWeather = [[[cityDict objectForKey:@"weather"] objectAtIndex:0]objectForKey:@"description"];
    
    self.nameOfCityLabel.text = [NSString stringWithFormat:@"%@", nameOfCity];
    self.tempNowLabel.text = [NSString stringWithFormat:@"Current Temp: %@\u00B0F", tempNow];
    self.tempMinLabel.text = [NSString stringWithFormat:@"min: %@\u00B0F", tempMin];
    self.tempMaxLabel.text = [NSString stringWithFormat:@"max: %@\u00B0F", tempMax];
    self.humidityLabel.text = [NSString stringWithFormat:@"Humidity: %@%%", cityHumidity];
    self.descriptionLabel.text = descriptionOfWeather;
    
}
@end
