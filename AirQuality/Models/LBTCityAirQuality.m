//
//  LBTCityAirQuality.m
//  AirQuality
//
//  Created by tyson ericksen on 12/4/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import "LBTCityAirQuality.h"
#import "LBTWeather.h"
#import "LBTPollution.h"

@implementation LBTCityAirQuality

- (instancetype)initWithState:(NSString *)state City:(NSString *)city country:(NSString *)country weather:(LBTWeather *)weather pollution:(LBTPollution *)pollution
{
    self = [super init];
    if (self) {
        
        _state = state;
        _city = city;
        _country = country;
        _weather = weather;
        _pollution = pollution;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSString *city = dictionary[@"city"];
    NSString *state = dictionary[@"state"];
    NSString *country = dictionary[@"country"];
    NSDictionary *currentInfo = dictionary[@"current"];
    
    LBTWeather *weather = [[LBTWeather alloc] initWithDictionary:currentInfo[@"weather"]];
    LBTPollution *pollution = [[LBTPollution alloc] initWithDictionary:currentInfo[@"pollution"]];
    
    return [self initWithState:state City:city country:country weather:weather pollution:pollution];
}

@end
