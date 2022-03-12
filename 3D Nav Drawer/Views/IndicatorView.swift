//
//  IndicatorView.swift
//  3D Nav Drawer
//
//  Created by Yash Shah on 05/03/22.
//

import Foundation
import UIKit

public final class IndicatorView: UIView {
    
    let imageIndicator = UIView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(imageIndicator)
        imageIndicator.translatesAutoresizingMaskIntoConstraints = false
        imageIndicator.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageIndicator.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        imageIndicator.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
        imageIndicator.backgroundColor = .white
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        imageIndicator.layer.cornerRadius = frame.height/2
    }
}
