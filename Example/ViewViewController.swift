//
//  ViewViewController.swift
//  CustomViewRow
//
//  Created by Mark Alldritt on 2017-09-18.
//  Copyright © 2017 Late Night Software Ltd. All rights reserved.
//

import UIKit
import Eureka
import SwiftChart


class ViewViewController: FormViewController {

    let initialHeight = Float(200.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        form
            
            +++ Section("Custom View")
            
                <<< LabelRow() { (row) in
                    row.title = "A Row"
                    row.value = "Hello World"
                }
            
                <<< ViewRow<UIView>()
                .cellSetup { (cell, row) in
                    //  Construct the view - in this instance the a rudimentry view created here
                    cell.view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
                    cell.view!.backgroundColor = UIColor.orange
                }
            
                <<< LabelRow() { (row) in
                    row.title = "Another Row"
                    row.value = "Hello Again"
                }

            +++ Section("Custom View with title")
            
                <<< LabelRow() { (row) in
                    row.title = "A Row"
                    row.value = "Hello World"
                }
                
                <<< ViewRow<UIView>() { (row) in
                    row.title = "Title For Custom View Row"
                }
                .cellSetup { (cell, row) in
                    //  Construct the view - in this instance the a rudimentry view created here
                    cell.view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
                    cell.view!.backgroundColor = UIColor.green
                }
                
                <<< LabelRow() { (row) in
                    row.title = "Another Row"
                    row.value = "Hello Again"
                }

            
            
            +++ Section("Custom View without title or margins")
            
                <<< LabelRow() { (row) in
                    row.title = "A Row"
                    row.value = "Hello World"
                }
                
                <<< ViewRow<UIView>()
                .cellSetup { (cell, row) in
                    //  Construct the view - in this instance the a rudimentry view created here
                    cell.view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
                    cell.view!.backgroundColor = UIColor.blue
                    
                    //  Adjust the cell margins to suit
                    cell.viewTopMargin = 0.0
                    cell.viewBottomMargin = 0.0
                    cell.viewLeftMargin = 0.0
                    cell.viewRightMargin = 0.0
                }
                
                <<< LabelRow() { (row) in
                    row.title = "Another Row"
                    row.value = "Hello Again"
                }
    }
}

