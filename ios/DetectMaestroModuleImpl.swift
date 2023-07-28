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

    @objc public func isMaestro() -> Int {
        return isUrlReachable(ipAddress: "http://localhost", port: 22087) ? 1 : 0;
    }
}
