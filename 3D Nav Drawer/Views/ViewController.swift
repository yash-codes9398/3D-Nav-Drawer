//
//  ViewController.swift
//  3D Nav Drawer
//
//  Created by Yash Shah on 04/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private let detailsView = DetailsView()
    
    private var isMenuShown: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let menuView = MenuView(frame: view.frame)
        view.addSubview(menuView)
        menuView.delegate = self
        
        view.layer.addSublayer(detailsView.layer)
        detailsView.frame = view.frame
        detailsView.layer.zPosition = 1000
        detailsView.delegate = self
        detailsView.updateHeaderTitle(toText: menuView.getCurrentTitle())
    }
}

extension ViewController: DetailsViewProtocol {
    
    func detailsView(headerLeftButtonTapped forView: DetailsView) {
        if !isMenuShown {
            UIView.animate(withDuration: 0.7) {
                forView.layer.cornerRadius = 20
                forView.layer.cornerCurve = .circular
                let layer = forView.layer
                var transform = CATransform3DIdentity
                transform.m34 = -1/500
                transform = CATransform3DTranslate(transform, 250, 0, 0)
                transform = CATransform3DRotate(transform, -0.25, 0, 1, 0)
                layer.transform = transform
            }
        } else {
            UIView.animate(withDuration: 0.7) {
                forView.layer.cornerRadius = .zero
                forView.layer.cornerCurve = .circular
                let layer = forView.layer
                layer.transform = CATransform3DIdentity
            }
        }
        isMenuShown.toggle()
    }
}

extension ViewController: MenuViewDelegate {
    
    func menuView(_ view: MenuView, selectedIndexChangedTo selectedIndex: Int) {
        detailsView.updateHeaderTitle(toText: view.getCurrentTitle())
    }
}

