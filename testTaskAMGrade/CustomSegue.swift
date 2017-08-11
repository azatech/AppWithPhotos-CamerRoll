//
//  CustomSegue.swift
//  testTaskAMGrade
//
//  Created by Azat IOS on 10.08.17.
//  Copyright © 2017 azatech. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {

    override func perform() {
        scale()
    }
    
        func scale() {
            let toBrowserVC = self.destination
            let fromPhotoPickerVC   = self.source
            // View to Scale
            let containerView   = fromPhotoPickerVC.view.superview
            let originalCenter  = fromPhotoPickerVC.view.center

            toBrowserVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
            toBrowserVC.view.center    = originalCenter

            containerView?.addSubview(toBrowserVC.view)

            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                toBrowserVC.view.transform = CGAffineTransform.identity
            }, completion: { success in
                fromPhotoPickerVC.present(toBrowserVC, animated: false, completion: nil)
            })
    }
}
