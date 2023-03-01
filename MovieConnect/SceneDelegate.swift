// Copyright © 2023 Almost Engineer. All rights reserved.

import UIKit
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = makeRootController()
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
    
    private func makeRootController() -> UIViewController {
        let vc = UIHostingController(
            rootView: TabView {
                NavigationStack {
                    MovieListView(viewModel: .init())
                        .navigationTitle("Library")
                        
                }.tabItem {
                    Label("Library", systemImage: "list.dash")
                }
                
                NavigationStack {
                    MovieListView(viewModel: .init())
                        .navigationTitle("Search")
                        
                }.tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            }
        )
        return vc
    }
}
