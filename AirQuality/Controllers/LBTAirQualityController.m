//
//  LBTAirQualityController.m
//  AirQuality
//
//  Created by tyson ericksen on 12/4/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import "LBTAirQualityController.h"
#import "LBTCityAirQuality.h"

NSString *baseURLString = @"https://api.airvisual.com/v2";
NSString *countryComponent = @"countries";
NSString *stateComponent = @"states";
NSString *cityComponent = @"cities";
NSString *cityDetailsComponent = @"city";
NSString *apiKey = @"cbbc059d-fb4a-44cf-8300-e3658a4201b0";

@implementation LBTAirQualityController

+ (void)fetchSupportedCountries:(void (^)(NSArray<NSString *> * _Nonnull, NSError * ))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURL *countryURL = [baseURL URLByAppendingPathComponent:countryComponent];
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"key" value:apiKey];
    NSURLComponents *combinedURL = [NSURLComponents componentsWithURL:countryURL resolvingAgainstBaseURL:true];
    combinedURL.queryItems = @[apiKeyItem];
    NSURL *finalURL = combinedURL.URL;

    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            completion([NSArray new], error);
            return;
        }
        if (response) {
            NSLog(@"%@", response);
            return;
        }
       
        if (!data) {
            NSLog(@"%@", error);
            completion([NSArray new], nil);
            return;
        }
        
        NSMutableArray *countryArray = [NSMutableArray new];
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSDictionary *dataDictionary = topLevelDictionary[@"data"];
        
        for (NSDictionary *countryDictionary in dataDictionary) {
            NSString *country = [[NSString alloc] initWithString:countryDictionary[@"country"]];
            [countryArray addObject:country];
        }
        return completion(countryArray, nil);
        
    }] resume];
}

+ (void)fetchSupportedStatesInCountry:(NSString *)country completion:(void (^)(NSArray<NSString *> * _Nonnull, NSError * _Nonnull))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURL *stateURL = [baseURL URLByAppendingPathComponent:stateComponent];
    NSURLQueryItem *countryQuery = [NSURLQueryItem queryItemWithName:@"country" value:country];
    NSURLComponents *combinedURL = [NSURLComponents componentsWithURL:stateURL resolvingAgainstBaseURL:true];
    combinedURL.queryItems = @[countryQuery];
    NSURL *finalURL = combinedURL.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            completion([NSArray new], error);
            return;
        }
        if (response) {
            NSLog(@"%@", response);
            return;
        }
        
        if (!data) {
            NSLog(@"%@", error);
            completion([NSArray new], nil);
            return;
        }
        NSMutableArray *stateArray = [NSMutableArray new];
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = topLevelDictionary[@"data"];
        for (NSDictionary *stateDictionary in dataDictionary) {
            NSString *state = [[NSString alloc] initWithString:stateDictionary[@"state"]];
            [stateArray addObject:state];
        }
        return completion(stateArray, nil);
        
    }] resume];
    
}

+ (void)fetchSupportedCitiesInStates:(NSString *)state country:(NSString *)country completion:(void (^)(NSArray<NSString *> * _Nonnull, NSError * _Nonnull))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURL *cityURL = [baseURL URLByAppendingPathComponent:cityComponent];
    NSURLQueryItem *countryQuery = [NSURLQueryItem queryItemWithName:@"country" value:country];
    NSURLQueryItem *stateQuery = [NSURLQueryItem queryItemWithName:@"state" value:state];
    NSURLComponents *combinedURL = [NSURLComponents componentsWithURL:cityURL resolvingAgainstBaseURL:true];
    combinedURL.queryItems = @[countryQuery] @[stateQuery];
    NSURL *finalURL = combinedURL.URL;
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            completion([NSArray new], error);
            return;
        }
        if (response) {
            NSLog(@"%@", response);
            return;
        }
        
        if (!data) {
            NSLog(@"%@", error);
            completion([NSArray new], nil);
            return;
        }
        
        NSMutableArray *cityArray = [NSMutableArray new];
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSDictionary *dataDictionary = topLevelDictionary[@"data"];
        
        for (NSDictionary *cityDictionary in dataDictionary) {
            NSString *city = [[NSString alloc] initWithString:cityDictionary[@"city"]];
            [cityArray addObject:city];
        }
        return completion(cityArray, nil);
        
    }] resume];
}


+ (void)fetchDataForCity:(NSString *)country state:(NSString *)state city:(NSString *)city completion:(void (^)(LBTCityAirQuality *))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURL *cityDetailsURL = [baseURL URLByAppendingPathComponent:cityDetailsComponent];
    NSURLQueryItem *countryQuery = [NSURLQueryItem queryItemWithName:@"country" value:country];
    NSURLQueryItem *stateQuery = [NSURLQueryItem queryItemWithName:@"state" value:state];
    NSURLQueryItem *cityQuery = [NSURLQueryItem queryItemWithName:@"city" value:city];
    NSURLComponents *combinedURL = [NSURLComponents componentsWithURL:cityDetailsURL resolvingAgainstBaseURL:true];
    combinedURL.queryItems = @[countryQuery] @[stateQuery] @[cityQuery];
    NSURL *finalURL = combinedURL.URL;
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        if (response) {
            NSLog(@"%@", response);
            return;
        }
        
        if (!data) {
            NSLog(@"%@", error);
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = topLevelDictionary[@"data"];
        LBTCityAirQuality *cityAQI = [[LBTCityAirQuality alloc] initWithDictionary:dataDictionary];
        completion(cityAQI);
       
    
    }] resume];
    
}

@end
