//
//  SeattleWeather.h
//  HW6 CocoaPods
//
//  Created by Macy Aviles on 11/14/13.
//  Copyright (c) 2013 Macy Aviles. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WeatherDataDelegate;

@interface SeattleWeather : NSObject

@property (strong, nonatomic) NSString *nameOfCity;
@property (nonatomic) NSUInteger tempNow;
@property (nonatomic) NSUInteger tempMin;
@property (nonatomic) NSUInteger tempMax;
@property (nonatomic) NSUInteger humidity;
@property (strong, nonatomic) NSString *descriptionOfWeather;

@property (weak, nonatomic)id<WeatherDataDelegate> delegate;
@end

@protocol WeatherDataDelegate <NSObject>


@end

