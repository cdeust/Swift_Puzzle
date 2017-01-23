//
//  UIButton+IntrinsicContentSize.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    class func intrinsicContentSize() -> CGSize
    {
        let s = self.intrinsicContentSize()
        return CGSize(width: s.width + self.init().titleEdgeInsets.left + self.init().titleEdgeInsets.right, height: s.height + self.init().titleEdgeInsets.top + self.init().titleEdgeInsets.bottom)
    }
}
