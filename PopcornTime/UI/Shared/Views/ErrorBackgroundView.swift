

import UIKit

class ErrorBackgroundView: UIView {
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var descriptionLabel: UILabel?
    
    
    func setUpView(title: String? = nil, description: String? = nil) {
        titleLabel?.text = title
        descriptionLabel?.text = description
    }
    
    func setUpView(error: NSError) {
        let helpfulDescription: String
        let title: String
        switch error.code {
        case -1200:
            title = "SSL Error - CALL RYAN!".localized
            helpfulDescription = "Tell Ryan the error is: It looks like your ISP/Network admin is blocking our servers. You can try again with a VPN to hide your internet traffic from them.".localized
        case -404:
            title = "Not found - CALL RYAN!".localized
            helpfulDescription = "Tell Ryan the error is: Please check your internet connection and try again.".localized
        case -1005, -1009:
            title = "You're Offline - CALL RYAN!".localized
            helpfulDescription = "Tell Ryan the error is: Please make sure you have a valid internet connection and try again.".localized
        default:
            title = "Unknown Error".localized
            helpfulDescription = error.localizedDescription
        }
        setUpView(title: title, description: helpfulDescription)
    }
}
