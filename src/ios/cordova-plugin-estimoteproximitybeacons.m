/********* cordova-plugin-estimoteproximitybeacons.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <EstimoteProximitySDK/EPXCloudCredentials.h>
#import <EstimoteProximitySDK/EPXDeviceAttachment.h>
#import <EstimoteProximitySDK/EPXProximityObserver.h>
#import <EstimoteProximitySDK/EPXProximityZone.h>
#import "cordova-plugin-estimoteproximitybeacons.h"
#import <EstimoteProximitySDK/EstimoteProximitySDK.h>

@interface EstimoteProximityBeacons ()

@property (nonatomic, strong) EPXCloudCredentials   *credentials;
@property (nonatomic, strong) EPXProximityObserver  *observer;
@property (nonatomic, strong) EPXDeviceAttachment   *attachment;
@property (nonatomic, strong) EPXProximityZone      *zone;
@property (nonatomic, strong) EPXProximityRange     *range;

@end

NSString* appID;
NSString* appToken;
NSString* deviceIdentifier;
NSString* tag;

NSArray<EPXProximityZone *> * zones;
NSDictionary<NSString *, id> *payload;

EPXCloudCredentials* credentials;
EPXCloudCredentials* configuration;
EPXCloudCredentials* errorBlock;

EPXProximityRange* range;

id <CDVCommandDelegate> pluginCommandDelegate;

void successCallback(NSString* callbackId, NSDictionary* data) {
    CDVPluginResult* commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:data];
    commandResult.keepCallback = @1;
    [pluginCommandDelegate sendPluginResult:commandResult callbackId:callbackId];
}

void failureCallback(NSString* callbackId, NSDictionary* data) {
    CDVPluginResult* commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:data];
    commandResult.keepCallback = @1;
    [pluginCommandDelegate sendPluginResult:commandResult callbackId:callbackId];
}

@implementation EstimoteProximityBeacons

- (void)init:(CDVInvokedUrlCommand*)command {
    pluginCommandDelegate = self.commandDelegate;

    NSString* appID = (NSString *)command.arguments[0];
    NSString* appToken = (NSString *)command.arguments[1];
    
    [_credentials initWithAppID:appID
                       appToken:appToken];
}


/**
* EPXDeviceAttachment
*/
- (void)initWithDeviceIdentifier:(CDVInvokedUrlCommand*)command {
    deviceIdentifier = command.arguments[0];
    payload = command.arguments[1];

    [_attachment initWithDeviceIdentifier:deviceIdentifier payload:payload];
}

// - (void)isEqualToAttachment:(CDVInvokedUrlCommand*)command;

// - (void)isEqual:(CDVInvokedUrlCommand*)command;

// - (void)hash:(CDVInvokedUrlCommand*)command;


/**
* EPXProximityObserver
*/
- (void)initWithCredentials:(CDVInvokedUrlCommand*)command {
    credentials = command.arguments[0];
    configuration = command.arguments[1];

    [_observer initWithCredentials:(EPXCloudCredentials *)credentials
                     configuration:(EPXProximityObserverConfiguration *)configuration
                        errorBlock:(void (^)(NSError *error))errorBlock];
}

- (void)startObservingZones:(CDVInvokedUrlCommand*)command {
    zones = command.arguments[0];

    [_observer startObservingZones:zones];
}

- (void)stopObservingZones:(CDVInvokedUrlCommand*)command {
    [_observer stopObservingZones];
}


/**
* EPXProximityRange
*/
// - (void)initWithDesiredMeanTriggerDistance:(CDVInvokedUrlCommand*)command {
//     desiredMeanTriggerDistance = command.arguments[0];

//     [_range initWithDesiredMeanTriggerDistance:desiredMeanTriggerDistance];
// }

// - (void)isEqualToRange:(CDVInvokedUrlCommand*)command;


/**
* EPXProximityZone
*/
- (void)initWithRange:(CDVInvokedUrlCommand*)command {
    range = command.arguments[0];
    tag = command.arguments[1];

    [_zone initWithRange:range
                     tag:tag];
}


@end
