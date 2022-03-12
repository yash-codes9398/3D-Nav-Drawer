//
//  MenuProfileHeader.swift
//  3D Nav Drawer
//
//  Created by Yash Shah on 04/03/22.
//

import Foundation
import UIKit

public final class MenuProfileHeader: UIView {
    
    let profileImage = UIImageView()
    let profileName = UILabel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(profileImage)
        addSubview(profileName)
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        profileImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        profileImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 44).isActive = true
        profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor).isActive = true
        profileImage.image = UIImage(systemName: "person.crop.circle")
        profileImage.tintColor = .white
        
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 12).isActive = true
        profileName.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor).isActive = true
        profileName.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        profileName.text = "Yash Shah"
        profileName.textColor = .white
        profileName.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
    }
}
