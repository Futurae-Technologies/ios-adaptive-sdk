[![Swift 5.5](https://img.shields.io/badge/Swift-5.5-orange.svg)](https://github.com/apple/swift)
[![iOS](https://img.shields.io/badge/iOS-10.0+-blue.svg)]()
[![spm](https://img.shields.io/badge/spm-compatible-green.svg)](https://www.swift.org/package-manager)

# AdaptiveSDK

The AdaptiveSDK was created to gather such information as:

- Bluetooth devices nearby, 
- Network devices nearby,
- IP address,
- Name of WiFi network the device is connected to,
- User location.

## Required setup

To be able to gather all signals you need to provide configuration and description for system permissions e.g. Bluetooth, Wi-Fi, and location in your host application.

>**Note:** An exception will be thrown if these are not set up.

### 1. Set up Bluetooth:

Add `Privacy - Bluetooth Always Usage Description` key to your `Info.plist`.

```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>{{App}} requires bluetooth access for adaptive mechanism.</string>
```

### 2. Set up Local Network:

#### 2.1 Add WiFi capability

In your Xcode project, select the **Capabilities** tab and choose `Access WiFi Information` from the list.

#### 2.2 Edit plist

Add `Privacy - Local Network Usage Description` key to your `Info.plist`.

```xml
<key>NSLocalNetworkUsageDescription</key>
<string>{{App}} requires access to your local network for adaptive mechanism.</string>
```

Add `Bonjour services` key to your `Info.plist`.

```xml
<key>NSBonjourServices</key>
<array>
	<string>_smb._tcp.</string>
	<string>_privet._tcp.</string>
	<string>_device-info._tcp.</string>
	<string>_sftp-ssh._tcp.</string>
	<string>_airplay._tcp.</string>
	<string>_scanner._tcp.</string>
	<string>_mediaremotetv._tcp.</string>
	<string>_rdlink._tcp.</string>
	<string>_rfb._tcp.</string>
	<string>_uscan._tcp.</string>
	<string>_companion-link._tcp.</string>
	<string>_apple-mobdev2._tcp.</string>
	<string>_b._dns-sd._udp.</string>
	<string>_afpovertcp._tcp.</string>
	<string>_nfs._tcp.</string>
	<string>_webdav._tcp.</string>
	<string>_ftp._tcp.</string>
	<string>_ssh._tcp.</string>
	<string>_eppc._tcp.</string>
	<string>_http._tcp.</string>
	<string>_telnet._tcp.</string>
	<string>_printer._tcp.</string>
	<string>_ipp._tcp.</string>
	<string>_pdl-datastream._tcp.</string>
	<string>_riousbprint._tcp.</string>
	<string>_daap._tcp.</string>
	<string>_dpap._tcp.</string>
	<string>_ichat._tcp.</string>
	<string>_presence._tcp.</string>
	<string>_ica-networking._tcp.</string>
	<string>_airport._tcp.</string>
	<string>_xserveraid._tcp.</string>
	<string>_distcc._tcp.</string>
	<string>_apple-sasl._tcp.</string>
	<string>_workstation._tcp.</string>
	<string>_servermgr._tcp.</string>
	<string>_raop._tcp.</string>
	<string>_xcs2p._tcp.</string>
</array>
```

### 3. Set up Location:

Add `Privacy - Location When In Use Usage Description` key to your `Info.plist`.

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>{{App}} requires access to your location for adaptive mechanism.</string>
```

## Code usage

1. Add import of the `AdaptiveSDK` library.
2. Initialize an instance of `AdaptiveSDK` class.
3. Configure delegate property in `AdaptiveSDK` instance so you will be notified when data collection is finished.
4. Invoke one of below methods:
	* `startScanning` - starts collecting data with automatic mode that starts scanning when receive: `didBecomeActiveNotification` event (app goes to foreground). It is scheduled as a background task so it's important to call `completeScanning` when you are done with collected data operations (e.g. after sending them to the backend).
	* `startScanningOnce` - starts one data collection (there are no events for resuming).

Below you can find example usage in AppDelegate class:

```swift
import AdaptiveSDK

class AppDelegate: NSObject, UIApplicationDelegate, AdaptiveSDKDelegate {

    lazy var adaptiveSDK = AdaptiveSDK()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ...
        adaptiveSDK.delegate = self

        // Trigger first scan by invoking
        adaptiveSDK.startScanning() // scan and handle foreground events to re-scan
        // or
        adaptiveSDK.startScanningOnce() // scan only one time

        return true
    }
    
    // MARK: - AdaptiveSDKDelegate
    
    func didReceiveUpdate(collectedData: [String : Any]) {
        // use collected data
    }

}
```

## Installation

### SPM
You can add `AdaptiveSDK` to an Xcode project by adding it as a package dependency.

  1. From the **File** menu, select **Swift Packages › Add Package Dependency…**
  2. Enter **git@github.com:Futurae-Technologies/ios-adaptive-sdk.git** into the package repository URL text field.
  
### Carthage

You can add AdaptiveSDK by adding the following line to your Cartfile:

```
binary https://github.com/Futurae-Technologies/ios-sdk/blob/master/CarthageJson/FuturaeKit.json
```

### Manually
You can also integrate Adaptive SDK manually by embedding the framework from this repo into your project.
