import ExpoModulesCore

public class ExpoPencilkitModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoPencilkit")
    View(ExpoPencilkitView.self) {
        Prop("sampleId") { (view, sampleId: String) in
            view.pkView.setSampleId(sampleId)
        }
        Prop("url") { (view, url: String) in
            view.pkView.setURL(url)
        }
        Prop("_id") { (view, _id: String) in
            view.pkView.setID(_id)
        }
        Prop("width") { (view, width: Numeric) in
            view.pkView.setWidth(width)
        }
        Prop("height") { (view, height: Numeric) in
            view.pkView.setHeight(height)
        }
    }
  }
}

