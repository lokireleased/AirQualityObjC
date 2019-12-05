//
//  LBTWeather.m
//  AirQuality
//
//  Created by tyson ericksen on 12/4/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import "LBTWeather.h"

@implementation LBTWeather

- (instancetype)initWithHumidity:(NSNumber *)humidity windSpeed:(NSNumber *)windSpeed temperature:(NSNumber *)temperature
{
    self = [super init];
    if (self) {
        _humidity = humidity;
        _windSpeed = windSpeed;
        _temperature = temperature;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSNumber *humidity = dictionary[@"hu"];
    NSNumber *windSpeed = dictionary[@"ws"];
    NSNumber *temperature = dictionary[@"tp"];
    
    return [self initWithHumidity:humidity windSpeed:windSpeed temperature:temperature];
}

@end
