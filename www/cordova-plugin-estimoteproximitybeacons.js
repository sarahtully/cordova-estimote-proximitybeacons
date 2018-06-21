var exec = require('cordova/exec');

/*********************************************************/
/***************** Estimote Namespaces *******************/
/*********************************************************/

/**
 * Main exported module.
 * @namespace estimote
 */
var EstimoteProximitySDK = function() {};


/**
 * Set App ID and App Token.
 *
 * @see {@link https://estimote.github.io/iOS-Proximity-SDK/Classes/EPXCloudCredentials.html|Further details}
 *
 * @param {string} appID The App ID (mandatory).
 * @param {string} appToken The App Token (mandatory).
 * @param {SuccessCallbackNoParams} [success] Function called on success (optional).
 * @param {ErrorCallback} [error] Function called on error (optional).
 *
 * @example Example that sets App ID and App Token:
 *   EstimoteProximitySDK.initWithAppID('MyAppID', 'MyAppToken')
 */
EstimoteProximitySDK.prototype.initWithAppID = function(appID, appToken, onSuccess, onError)
{
	exec(onSuccess, onError, 'EstimoteProximitySDK', 'initWithAppID', [appID, appToken]);
};


/**
 * Start observing and calling callbacks on provided proximity zones
 *
 * @see {@link https://estimote.github.io/iOS-Proximity-SDK/Classes/EPXProximityObserver.html|Further details}
 *
 * @param {Array} zones Represents a logical zone. Is represented by range from a beacon and attachment rule (attachment key + attachment value).
 * @param {SuccessCallbackNoParams} [success] Function called on success (optional).
 * @param {ErrorCallback} [error] Function called on error (optional).
 *
 * @example Example that starts observing proximity zones:
 *   EstimoteProximitySDK.startObservingZones(zones)
 */
EstimoteProximitySDK.prototype.startObservingZones = function(zones, onSuccess, onError)
{
	if (onSuccess == null) {
		onSuccess = function() {};
	}

	if (onError == null) {
		onError = function() {};
	}

	if (zones) {
		onError = onSuccess;
		onSuccess = zones;

		exec(success, error, 'EstimoteProximitySDK', 'startObservingZones', [zones]);
	}
};


/**
 * Stop observing and calling callbacks for all zones that were provided with -startObservingZones
 *
 * @see {@link https://estimote.github.io/iOS-Proximity-SDK/Classes/EPXProximityObserver.html|Further details}
 *
 * @example Example that stops observing proximity zones:
 *   EstimoteProximitySDK.stopObservingZones()
 */
EstimoteProximitySDK.prototype.stopObservingZones = function(onSuccess, onError)
{
	exec(onSuccess, onError, 'EstimoteProximitySDK', 'stopObservingZones', []);
};


if (!window.plugins) {
		window.plugins = {};
}

if (!window.plugins.EstimoteProximitySDK) {
		window.plugins.EstimoteProximitySDK = new EstimoteProximitySDK();
}

if (typeof module != 'undefined' && module.exports) {
		module.exports = EstimoteProximitySDK;
}