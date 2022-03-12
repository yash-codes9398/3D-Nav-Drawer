//
//  MenuOptionsCell.swift
//  3D Nav Drawer
//
//  Created by Yash Shah on 05/03/22.
//

import Foundation
import UIKit

public final class MenuOptionsCell: UITableViewCell {
    
    let menuImageView = UIImageView()
    let menuLabel = UILabel()
    var menuImageViewLeadingConstraint: NSLayoutConstraint?
    var menuLabelLeadingConstraint: NSLayoutConstraint?
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createViews()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        contentView.heightAnchor.constraint(equalToConstant: 72).isActive = true
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        contentView.addSubview(menuImageView)
        contentView.addSubview(menuLabel)
        
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        menuImageViewLeadingConstraint = menuImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24)
        menuImageViewLeadingConstraint?.isActive = true
        menuImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        menuImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        menuImageView.heightAnchor.constraint(equalTo: menuImageView.widthAnchor).isActive = true
        
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        menuLabelLeadingConstraint = menuLabel.leadingAnchor.constraint(equalTo: menuImageView.trailingAnchor, constant: 8)
        menuLabelLeadingConstraint?.isActive = true
        menuLabel.textColor = .white
        menuLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        menuLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    public func setData(menuImage: String, menuText: String, isSelected: Bool) {
        menuImageView.image = UIImage(systemName: menuImage)
        menuLabel.text = menuText
        setSelected(isSelected: isSelected)
    }
    
    public func setSelected(isSelected: Bool) {
        if isSelected {
            menuImageViewLeadingConstraint?.constant = 48
            menuLabelLeadingConstraint?.constant = 16
            menuImageView.tintColor = .purple
        } else {
            menuImageViewLeadingConstraint?.constant = 24
            menuLabelLeadingConstraint?.constant = 8
            menuImageView.tintColor = .white
        }
    }
    
    func getContentWidthForIndicator() -> CGFloat {
        return 8 + 30 + 16 + menuLabel.intrinsicContentSize.width + 16
    }
}
