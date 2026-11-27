import Foundation

@objc(DetectMaestroModuleImpl)
public class DetectMaestroModuleImpl : NSObject {
    private func isUrlReachable(ipAddress:String!, port:Int) -> Bool {
        var isRunning:Bool = false
        
        let semaphore = DispatchSemaphore(value: 0)
        let urlPath = String(format:"%@:%zd", ipAddress, port)
        let url = URL(string: urlPath)
        if (url == nil) {
            return false
        }
        let session = URLSession.shared
        session.dataTask(with:url!) { (data, response, error) -> Void in
            if error == nil, let response = response as? HTTPURLResponse {
                isRunning = response.statusCode == 404
            } else {
                isRunning = false
            }
            semaphore.signal()
        }.resume()
        semaphore.wait()

        return isRunning
    }

    // Maestro 2.x: `launchApp: { arguments: { isMaestro: true } }` is passed as process arguments:
    // ["-isMaestro", "true"] for a string value, ["isMaestro", "true"] for a boolean value
    private func hasLaunchArgument() -> Bool {
        let args = ProcessInfo.processInfo.arguments
        for (index, arg) in args.enumerated() where arg == "-isMaestro" || arg == "isMaestro" {
            if index + 1 < args.count && args[index + 1] == "true" {
                return true
            }
        }
        return false
    }

    @objc public func isMaestro() -> Int {
        // Maestro 1.x: the XCTest runner listens on port 22087 (deprecated; in 2.x the port is random)
        return hasLaunchArgument() || isUrlReachable(ipAddress: "http://localhost", port: 22087) ? 1 : 0;
    }
}
