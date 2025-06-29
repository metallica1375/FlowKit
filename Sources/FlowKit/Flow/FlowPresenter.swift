import SwiftUI

@available(iOS 14, *)
public struct FlowPresenter<C: View>: View {
  
  @StateObject var flow: FlowProvider
  
  public init(rootView: C, customNavigationController: NavigationControllerSettings? = nil) {
    _flow = State(wrappedValue: FlowProvider(rootView: rootView,
                                             customNavigationController: customNavigationController))
  }
  
  public var body: some View {
    flow.present()
      .environmentObject(flow)
  }
}
