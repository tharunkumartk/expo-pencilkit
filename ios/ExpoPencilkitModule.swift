import ExpoModulesCore

public class ExpoPencilkitModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoPencilkit")
    View(ExpoPencilkitView.self) {
        Prop("sampleId") { (view, sampleId: String) in
            view.pkView.setSampleId(sampleId)
        }
    }
  }
}

