import ExpoModulesCore

public class ExpoPencilkitModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoPencilkit")
    View(ExpoPencilkitView.self) {
    }
  }
}

