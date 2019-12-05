//
//  LBTAirQualityController.h
//  AirQuality
//
//  Created by tyson ericksen on 12/4/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBTCityAirQuality.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBTAirQualityController : NSObject

+(void)fetchSupportedCountries:(void (^) (NSArray<NSString *> *, NSError *error))completion;

+(void)fetchSupportedStatesInCountry: (NSString *)country completion:(void (^) (NSArray<NSString *> *, NSError *error))completion;

+(void)fetchSupportedCitiesInStates: (NSString *)state country:(NSString *)country completion:(void (^) (NSArray<NSString *> *,NSError *error))completion;

+(void)fetchDataForCity: (NSString *)country state: (NSString *)state city:(NSString *)city completion:(void (^) (LBTCityAirQuality *)completion;

@end

NS_ASSUME_NONNULL_END
