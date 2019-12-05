//
//  LBTCityAirQuality.h
//  AirQuality
//
//  Created by tyson ericksen on 12/4/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBTWeather.h"
#import "LBTPollution.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBTCityAirQuality : NSObject

@property (nonatomic, readonly, copy) NSString *state;
@property (nonatomic, readonly, copy) NSString *city;
@property (nonatomic, readonly, copy) NSString *country;
@property (nonatomic, readonly, copy) LBTWeather *weather;
@property (nonatomic, readonly, copy) LBTPollution *pollution;

-(instancetype)initWithState: (NSString *)state City: (NSString *)city country: (NSString *)country weather: (LBTWeather *)weather pollution:(LBTPollution *)pollution;

-(instancetype)initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;


@end

NS_ASSUME_NONNULL_END


