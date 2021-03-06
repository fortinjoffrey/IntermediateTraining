//
//  IndentedLabel.swift
//  IntermediateTraining
//
//  Created by Joffrey Fortin on 09/03/2018.
//  Copyright © 2018 myCode. All rights reserved.
//

import UIKit

class IndentedLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        let customRect = rect.inset(by: insets)
        super.drawText(in: customRect)
    }
}
