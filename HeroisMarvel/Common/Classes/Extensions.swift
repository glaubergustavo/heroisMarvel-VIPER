//
//  Extensions.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import UIKit

extension String {
    
    func onlyDigits() -> String {
        
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    func isValidEmail() -> Bool {
        
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

extension UIApplication {
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let navigationController = controller as? UINavigationController {
            
            return topViewController(controller: navigationController.visibleViewController)
        }
        
        if let tabController = controller as? UITabBarController {
            
            if let selected = tabController.selectedViewController {
                
                return topViewController(controller: selected)
            }
        }
        
        if let presented = controller?.presentedViewController {
            
            return topViewController(controller: presented)
        }
        
        return controller
    }
}

extension URLResponse {
    
    func getStatusCode() -> Int? {
        
        if let httpResponse = self as? HTTPURLResponse {
            
            return httpResponse.statusCode
        }
        
        return nil
    }
}
