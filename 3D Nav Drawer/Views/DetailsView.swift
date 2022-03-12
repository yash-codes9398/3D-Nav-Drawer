//
//  DetailsView.swift
//  3D Nav Drawer
//
//  Created by Yash Shah on 12/03/22.
//

import Foundation
import UIKit

public protocol DetailsViewProtocol: AnyObject {
    func detailsView(headerLeftButtonTapped forView: DetailsView)
}

public final class DetailsView: UIView {

    private let headerLeftButton = UIImageView()
    private let headerTitleLabel = UILabel()
    private let headerRightButton = UIImageView()
    
    public weak var delegate: DetailsViewProtocol?
    
    public init() {
        super.init(frame: .zero)
        backgroundColor = .black
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(headerTitleLabel)
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
//        headerTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerTitleLabel.textColor = .white
        headerTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .black)
        headerTitleLabel.text = "Header Title"
        
        addSubview(headerLeftButton)
        headerLeftButton.translatesAutoresizingMaskIntoConstraints = false
        headerLeftButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        headerLeftButton.centerYAnchor.constraint(equalTo: headerTitleLabel.centerYAnchor).isActive = true
        headerLeftButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        headerLeftButton.widthAnchor.constraint(equalTo: headerLeftButton.heightAnchor).isActive = true
        headerLeftButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        headerTitleLabel.leadingAnchor.constraint(equalTo: headerLeftButton.trailingAnchor, constant: 12).isActive = true
        headerLeftButton.tintColor = .white
        headerLeftButton.image = UIImage(systemName: "menucard.fill")
        headerLeftButton.isUserInteractionEnabled = true
        headerLeftButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(headerLeftButtonTapped)))
        
        addSubview(headerRightButton)
        headerRightButton.translatesAutoresizingMaskIntoConstraints = false
        headerRightButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        headerRightButton.centerYAnchor.constraint(equalTo: headerTitleLabel.centerYAnchor).isActive = true
        headerRightButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        headerRightButton.widthAnchor.constraint(equalTo: headerRightButton.heightAnchor).isActive = true
        headerRightButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        headerTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: headerRightButton.leadingAnchor, constant: -12).isActive = true
        headerRightButton.tintColor = .white
        headerRightButton.image = UIImage(systemName: "person.circle.fill")
    }
    
    @objc private func headerLeftButtonTapped() {
        delegate?.detailsView(headerLeftButtonTapped: self)
    }
    
    public func updateHeaderTitle(toText text: String) {
        headerTitleLabel.text = text
    }
}
