//
//  CustomViewViewController.swift
//  CustomViewRow
//
//  Created by Mark Alldritt on 2017-09-18.
//  Copyright © 2017 Late Night Software Ltd. All rights reserved.
//

import UIKit
import Eureka
import SwiftChart


class CustomViewViewController: FormViewController {

    let initialHeight = Float(200.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        form
            
            +++ Section("Settings")
            
                <<< SliderRow("height") { (row) in
                    row.title = "Height"
                    row.cell.slider.minimumValue = 150.0
                    row.cell.slider.maximumValue = 500.0
                    row.value = self.initialHeight
                }
                .onChange { (row) in
                    if let newHeight = row.value {
                        //(self.form.rowBy(tag: "view") as? ViewRow<ResultView>)?.cell.height = { return CGFloat(newHeight) }
                        self.tableView.reloadRows(at: [row.indexPath!], with: .none) // forces the tableview to resize the rows
                        
                        //  Alter the contents of the view in some way...
                        if let resultRow = self.form.rowBy(tag: "view") as? ViewRow<ResultView>,
                            let resultView = resultRow.view {
                            resultView.n200Label.text = "-\(Int(newHeight))-"
                            resultView.p300Label.text = "*\(Int(newHeight))*"
                        }
                    }
                }

            
            
            +++ Section("Custom View from Nib")
            
                <<< LabelRow() { (row) in
                    row.title = "A Row"
                    row.value = "Hello World"
                }
            
                <<< ViewRow<ResultView>("view") { (row) in
                }
                .cellSetup { (cell, row) in
                    //  Construct the view - in this instance the view is loaded from a nib
                    let bundle = Bundle.main
                    let nib = UINib(nibName: "ResultView", bundle: bundle)
                    
                    cell.view = nib.instantiate(withOwner: self, options: nil)[0] as? ResultView
                    cell.view!.backgroundColor = cell.backgroundColor
                    
                    //  Define the cell's height - in this example I use the value of the height slider.
                    cell.height = { return CGFloat((self.form.rowBy(tag: "height") as? SliderRow)?.value ?? self.initialHeight) /*return CGFloat(self.initialHeight)*/ }
                }
            
                <<< LabelRow() { (row) in
                    row.title = "Another Row"
                    row.value = "Hello Again"
                }
    }
}
