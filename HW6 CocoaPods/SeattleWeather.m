//
//  SeattleWeather.m
//  HW6 CocoaPods
//
//  Created by Macy Aviles on 11/14/13.
//  Copyright (c) 2013 Macy Aviles. All rights reserved.
//

#import "SeattleWeather.h"

@implementation SeattleWeather

-(SeattleWeather *)initWithName:(NSString *)nameOfCity temp:(NSUInteger)tempNow temp_min:(NSUInteger)tempMin temp_max:(NSUInteger)tempMax humidity:(NSUInteger)humidity descriptionOfWeather:(NSString *)descriptionOfWeather
{
    self = [super init];
    if (self)
    {
        self.nameOfCity = nameOfCity;
        self.tempNow = tempNow;
        self.tempMin = tempMin;
        self.tempMax = tempMax;
        self.humidity = humidity;
        self.descriptionOfWeather = descriptionOfWeather;
    }
    return self;
}


@end
