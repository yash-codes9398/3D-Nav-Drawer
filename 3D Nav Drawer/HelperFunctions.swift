//
//  HelperFunctions.swift
//  3D Nav Drawer
//
//  Created by Yash Shah on 05/03/22.
//

import Foundation
import UIKit

public final class HelperFunctions {
    
    public static func getStatusBarHeight() -> CGFloat {
        return UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
}
