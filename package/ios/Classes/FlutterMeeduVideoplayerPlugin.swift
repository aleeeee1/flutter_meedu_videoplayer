import Flutter
import UIKit
import AVKit
import UIPiPView

public class FlutterMeeduVideoplayerPlugin: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_meedu_videoplayer", binaryMessenger: registrar.messenger())
        let instance = FlutterMeeduVideoplayerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel);
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            
        case "isPipAvailable":
            result(isPipAvailable())
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func isPipAvailable() -> Bool {
        if #available(iOS 14.0, *) {
            return AVPictureInPictureController.isPictureInPictureSupported()
        } else {
            return false
        }
    }
}
