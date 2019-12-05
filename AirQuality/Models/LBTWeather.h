//
//  LBTWeather.h
//  AirQuality
//
//  Created by tyson ericksen on 12/4/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBTWeather : NSObject

@property (nonatomic, readonly) NSNumber *humidity;
@property (nonatomic, readonly) NSNumber *windSpeed;
@property (nonatomic, readonly) NSNumber *temperature;

-(instancetype)initWithHumidity: (NSNumber *)humidity windSpeed: (NSNumber *)windSpeed temperature: (NSNumber *)temperature;

-(instancetype)initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
