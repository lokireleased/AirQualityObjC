//
//  LBTPollution.h
//  AirQuality
//
//  Created by tyson ericksen on 12/4/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBTPollution : NSObject

@property (nonatomic, readonly) NSInteger airQuailityIndex;

-(instancetype)initWithAirQuailityIndex: (NSInteger)airQualityIndex;

-(instancetype)initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
