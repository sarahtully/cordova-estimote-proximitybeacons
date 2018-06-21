#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

#import <EstimoteProximitySDK/EstimoteProximitySDK.h>

@interface EstimoteProximityBeacons : CDVPlugin

- (void)init:(CDVInvokedUrlCommand*)command;

// EPXCloudCredentials
// - (void)initWithAppID:(CDVInvokedUrlCommand*)command;

// EPXDeviceAttachment
- (void)initWithDeviceIdentifier:(CDVInvokedUrlCommand*)command;
// - (void)isEqualToAttachment:(CDVInvokedUrlCommand*)command;
// - (void)isEqual:(CDVInvokedUrlCommand*)command;
// - (void)hash:(CDVInvokedUrlCommand*)command;

// EPXProximityObserver
- (void)initWithCredentials:(CDVInvokedUrlCommand*)command;
- (void)startObservingZones:(CDVInvokedUrlCommand*)command;
- (void)stopObservingZones:(CDVInvokedUrlCommand*)command;

// EPXProximityRange
// - (void)initWithDesiredMeanTriggerDistance:(CDVInvokedUrlCommand*)command;
// - (void)isEqualToRange:(CDVInvokedUrlCommand*)command;

// EPXProximityZone
- (void)initWithRange:(CDVInvokedUrlCommand*)command;

@end