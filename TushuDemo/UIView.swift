

import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius : CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var 边框宽度: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable
    var 边框颜色: UIColor? {
        get {
            return layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil
        }
        set {
            layer.borderColor = newValue!.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity: Float{
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable
    var shadowColor : UIColor? {
        get {
            return layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) : nil
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
}
