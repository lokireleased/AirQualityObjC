//
//  LBTPollution.m
//  AirQuality
//
//  Created by tyson ericksen on 12/4/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import "LBTPollution.h"

@implementation LBTPollution

- (instancetype)initWithAirQuailityIndex:(NSInteger)airQualityIndex
{
    self = [super init];
    if (self) {
        _airQuailityIndex = airQualityIndex;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSInteger airQualityIndex = [dictionary[@"aqicn"] integerValue];
    
    return [self initWithAirQuailityIndex:airQualityIndex];
}

@end
