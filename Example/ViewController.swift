//
//  ViewController.swift
//  CustomViewRow
//
//  Created by Mark Alldritt on 2017-09-18.
//  Copyright © 2017 Late Night Software Ltd. All rights reserved.
//

import UIKit
import Eureka
import SwiftChart


class ViewController: FormViewController {

    let initialHeight = Float(200.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        form
            
            +++ Section("Examples")
            
                <<< ButtonRow() { (row) in
                    row.title = "UIView Rows"
                    row.presentationMode = PresentationMode.segueName(segueName: "UIView",
                                                                      onDismiss: nil)
                }
                <<< ButtonRow() { (row) in
                    row.title = "Custom View Rows"
                    row.presentationMode = PresentationMode.segueName(segueName: "CustomView",
                                                                      onDismiss: nil)
                }
                <<< ButtonRow() { (row) in
                    row.title = "UIImageView Rows"
                    row.presentationMode = PresentationMode.segueName(segueName: "UIImageView",
                                                                      onDismiss: nil)
                }
                <<< ButtonRow() { (row) in
                    row.title = "GraphView Row"
                    row.presentationMode = PresentationMode.segueName(segueName: "GraphView",
                                                                      onDismiss: nil)
                }

    }
}
