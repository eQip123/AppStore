//
//  CustomTextField.swift
//  AppStore
//
//  Created by Aidar Asanakunov on 15/10/22.
//

import UIKit

class CustomTextField: UITextField {
    
    let leftPadding = UIEdgeInsets(top: 0, left: 65, bottom: 0, right: 0)
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: leftPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: leftPadding)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: leftPadding)
    }
        
}
