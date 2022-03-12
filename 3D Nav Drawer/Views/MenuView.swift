//
//  MenuView.swift
//  3D Nav Drawer
//
//  Created by Yash Shah on 04/03/22.
//

import Foundation
import UIKit

public protocol MenuViewDelegate: AnyObject {
    func menuView(_ view: MenuView,
                  selectedIndexChangedTo selectedIndex: Int)
}

public final class MenuView: UIView {
    
    let menuProfileHeader = MenuProfileHeader(frame: .zero)
    let tableView = UITableView()
    let indicatorView = IndicatorView()
    
    public weak var delegate: MenuViewDelegate?
    var indicatorTopConstraint: NSLayoutConstraint?
    var indicatorWidthConstraint: NSLayoutConstraint?
    
    var selectedCell: Int = 0 {
        didSet {
            delegate?.menuView(self, selectedIndexChangedTo: selectedCell)
            (tableView.cellForRow(at: IndexPath(row: selectedCell, section: 0)) as? MenuOptionsCell)?.setSelected(isSelected: true)
            (tableView.cellForRow(at: IndexPath(row: oldValue, section: 0)) as? MenuOptionsCell)?.setSelected(isSelected: false)
            moveIndicator(withAnimation: true)
        }
    }
    
    let menuImages = ["house.circle.fill", "magnifyingglass.circle.fill", "safari.fill", "phone.circle.fill", "person.circle.fill", "gear.circle.fill", "info.circle.fill", "questionmark.circle.fill", "power.circle.fill"]
    let menuItems = ["Home", "Browse", "Discover", "Devices", "Profile", "Setting", "About", "Help", "Logout"]
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        backgroundColor = .darkGray
        
        addSubview(menuProfileHeader)
        menuProfileHeader.translatesAutoresizingMaskIntoConstraints = false
        menuProfileHeader.topAnchor.constraint(equalTo: topAnchor, constant: HelperFunctions.getStatusBarHeight() + 20).isActive = true
        menuProfileHeader.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: menuProfileHeader.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.backgroundColor = .clear
//        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
        tableView.register(MenuOptionsCell.self, forCellReuseIdentifier: MenuOptionsCell.self.description())
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundView = indicatorView
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorWidthConstraint = indicatorView.widthAnchor.constraint(equalToConstant: 100)
        indicatorWidthConstraint?.isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 46).isActive = true
        indicatorView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 40).isActive = true
        indicatorTopConstraint = indicatorView.topAnchor.constraint(equalTo: tableView.topAnchor)
        indicatorTopConstraint?.isActive = true
        indicatorView.layer.cornerRadius = 23
        indicatorView.backgroundColor = .purple
        tableView.sendSubviewToBack(indicatorView)
        
        DispatchQueue.main.async {
            self.moveIndicator(withAnimation: false)
        }
    }
    
    private func moveIndicator(withAnimation animation: Bool) {
        let indexPath = IndexPath(item: selectedCell, section: 0)
        let cell = self.tableView.cellForRow(at: indexPath) as? MenuOptionsCell
        let frame = self.tableView.rectForRow(at: indexPath)
        let centerY = (frame.minY + frame.maxY)/2
        let top = centerY - 8 - 15
        self.indicatorTopConstraint?.constant = top
        self.indicatorWidthConstraint?.constant = cell?.getContentWidthForIndicator() ?? 0
        if animation {
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
        } else {
            layoutIfNeeded()
        }
    }
    
    public func getCurrentTitle() -> String {
        return menuItems[selectedCell]
    }
}

extension MenuView: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuOptionsCell.self.description(), for: indexPath) as? MenuOptionsCell else { return UITableViewCell() }
        cell.setData(menuImage: menuImages[indexPath.row], menuText: menuItems[indexPath.row], isSelected: indexPath.row == selectedCell)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedCell == indexPath.row { return }
        selectedCell = indexPath.row
    }
}
