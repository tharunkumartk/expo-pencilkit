import ExpoModulesCore
import PencilKit
import UIKit


class ExpoPencilkitView: ExpoView  {
    let pencilkitView = PKCanvasView()
    
    
    required init(appContext: AppContext? = nil) {
      super.init(appContext: appContext)
      clipsToBounds = true
      addSubview(pencilkitView)
    }

    override func layoutSubviews() {
            pencilkitView.frame = bounds
    }
}
