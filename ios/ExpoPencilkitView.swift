import ExpoModulesCore
import PencilKit
import UIKit


class ExpoPencilkitView: ExpoView  {
    let pkView = PencilkitView()
    
    required init(appContext: AppContext? = nil) {
        super.init(appContext: appContext)
        clipsToBounds = true
        addSubview(pkView)
    }
    
    override func layoutSubviews() {
        pkView.frame = bounds
    }
    
}

