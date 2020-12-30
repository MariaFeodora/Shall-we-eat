//
//  MultipageView.swift
//  Shall-we-eat
//
//  Created by Halyna on 30/12/2020.
//

import SwiftUI
import UIKit

struct MultipageView<T: View>: View {
    let pages: [T]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack{
            MultiPageViewController(pages: pages, currentPage: $currentPage)
            VStack{
                Spacer()
                PageControlView (numberOfPages: pages.count, currentPage: $currentPage)
            }
        }
    }
}

protocol PageSelector {
    func selectPage(_ index: Int)
}

struct MultiPageViewController<T: View>: UIViewControllerRepresentable, PageSelector {
    
    let pages: [T]
    @Binding var currentPage: Int
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        let viewControllers: [UIViewController]
        let pageSelector: PageSelector
        
        init(pages: [T], pageSelector: PageSelector) {
            self.viewControllers = pages.map(UIHostingController.init)
            self.pageSelector = pageSelector
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
            guard index > 0  else {
                return nil
            }
            let newIndex = index - 1
            return viewControllers[newIndex]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
            guard index < viewControllers.count - 1 else {
                return nil
            }
            let newIndex = index + 1
            return viewControllers[newIndex]
    }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if let displayedViewController = pageViewController.viewControllers?.first, let newIndex = viewControllers.firstIndex(of: displayedViewController) {
                pageSelector.selectPage(newIndex)
            }
        }
    }
        
    func makeUIViewController(context: Context) -> some UIViewController {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageVC.dataSource = context.coordinator
        pageVC.delegate = context.coordinator
        pageVC.setViewControllers([context.coordinator.viewControllers.first!], direction: .forward, animated: false)
        return pageVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        guard let pageViewController = uiViewController as? UIPageViewController else { return }
        guard let previousViewController = pageViewController.viewControllers?.first else { return }
        guard let previousIndex = context.coordinator.viewControllers.firstIndex(of: previousViewController) else { return }
        guard previousIndex != currentPage else { return }
        let direction: UIPageViewController.NavigationDirection = previousIndex < currentPage ? .forward : .reverse
        pageViewController.setViewControllers([context.coordinator.viewControllers[currentPage]], direction: direction, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(pages: pages, pageSelector: self)
    }
    
    func selectPage(_ index: Int) {
        currentPage = index
    }
}

struct PageControlView: UIViewRepresentable {
    
    let numberOfPages: Int
    @Binding var currentPage: Int
    @Environment(\.colorScheme) var colorScheme
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = colorScheme == .dark ? .white : .black
        pageControl.numberOfPages = numberOfPages
        pageControl.addTarget(context.coordinator, action: #selector(Coordinator.pageDidChange), for: .primaryActionTriggered)
        context.coordinator.pageControl = pageControl
        return pageControl
    }
    
    func updateUIView(_ pageControl: UIPageControl, context: Context) {
        pageControl.currentPage = currentPage
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        let pageControlView: PageControlView
        var pageControl: UIPageControl?
        
        init(_ pageControlView: PageControlView) {
            self.pageControlView = pageControlView
        }
        
        @objc func pageDidChange() {
            if let currentPage = pageControl?.currentPage {
                pageControlView.currentPage = currentPage
            }
        }
    }
}

    
    
struct MultipageView_Previews: PreviewProvider {
    static var previews: some View {
        let page1 = AnyView(Text("Page1"))
        let page2 = AnyView(Text("Page2"))
        let page3 = AnyView(Text("Page3"))
        let pages = [page1, page2, page3]
        MultipageView(pages: pages)
    }
}
