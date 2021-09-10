//
//  Rotation.swift
//  SideMenuRotation
//
//  Created by iMac on 10/09/21.
//

import SwiftUI

enum RotationState {
    case showFirstView
    case hideFirstView
    
    case showSecondView
    case hideSecondView
    
    //Degree, offset, anchor, axis
    var rotationValue: (Double, CGFloat, UnitPoint, CGFloat) {
        switch self {
        case .showFirstView:
            return(0, 0, .leading, 1)
        case .hideFirstView:
            return(90, UIScreen.main.bounds.width - 48, .leading, 1)
        case .showSecondView:
            return(0, -48, .trailing, -1)
        case .hideSecondView:
            return(90, -UIScreen.main.bounds.width, .trailing, -1)
        }
    }
}


