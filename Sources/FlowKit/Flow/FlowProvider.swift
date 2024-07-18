import SwiftUI
import UIKit

public typealias NavigationControllerSettings = ((UIViewController) -> UINavigationController)

@available(iOS 13, *)
public final class FlowProvider: ObservableObject {
  
  var navigationController: UINavigationController
  var presenter: Presenter
  
  public init<C: View>(rootView: C,
                       customNavigationController: NavigationControllerSettings? = nil) {
    let navigationBarHiddenUIHostingController = NavigationBarHiddenUIHostingController(rootView: rootView)
    navigationController = {
      if let navigationController = customNavigationController?(navigationBarHiddenUIHostingController) {
        return navigationController
      } else {
        return UINavigationController(rootViewController: navigationBarHiddenUIHostingController)
      }
    }()
    presenter = Presenter(navigationController: navigationController)
  }
  
  public func present() -> some View {
    presenter
  }
  
  struct Presenter: UIViewControllerRepresentable {
    
    var navigationController: UINavigationController
    
    func makeUIViewController(context: Context) -> UINavigationController {
      return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
  }
}


class FlowKitNavigationController: UINavigationController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
            navigationController?.title = ""
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    
}

class NavigationBarHiddenUIHostingController<Content: View>: UIHostingController<Content> {
    
    private var observer: NSKeyValueObservation?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        observer = navigationController?.observe(
            \.navigationBar.isHidden,
            options: [.new]
        ) { [weak self] _, change in
            guard change.newValue == false else { return }
            self?.navigationController?.navigationBar.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        if navigationController?.isNavigationBarHidden == false {
            navigationController?.isNavigationBarHidden = true
        }
    }
}

final public class CustomUIHostingController<Content>: UIHostingController<Content> where Content: View {
    public override var navigationController: UINavigationController? {
        nil
    }
}
