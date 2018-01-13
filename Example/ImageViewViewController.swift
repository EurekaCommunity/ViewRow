//
//  ImageViewViewController.swift
//  CustomViewRow
//
//  Created by Mark Alldritt on 2017-09-18.
//  Copyright © 2017 Late Night Software Ltd. All rights reserved.
//

import UIKit
import Eureka
import SwiftChart


class ImageViewViewController: FormViewController {

    let initialHeight = Float(200.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        form
            
            +++ Section("Image View with title")
            
                <<< LabelRow() { (row) in
                    row.title = "A Row"
                    row.value = "Hello World"
                }
            
                <<< ViewRow<UIImageView>() { (row) in
                    row.title = "Title For Image View Row"
                }
                .cellSetup { (cell, row) in
                    //  Construct the view for the cell
                    cell.view = UIImageView(frame:CGRect(x: 0, y: 0, width: 100, height: 300))
                    cell.contentView.addSubview(cell.view!)
                    
                    //  Get something to display
                    let image = UIImage(named: "trees")
                    cell.view!.image = image
                }
            
                <<< LabelRow() { (row) in
                    row.title = "Another Row"
                    row.value = "Hello Again"
                }
            
            
            
            +++ Section("Image View without title or margins")
            
                <<< LabelRow() { (row) in
                    row.title = "A Row"
                    row.value = "Hello World"
                }
            
                <<< ViewRow<UIImageView>()
                .cellSetup { (cell, row) in
                    //  Construct the view for the cell
                    cell.view = UIImageView()
                    cell.contentView.addSubview(cell.view!)
                    
                    //  Get something to display
                    let image = UIImage(named: "trees")
                    cell.view!.image = image
                    
                    //  Make the image view occupy the entire row:
                    cell.viewRightMargin = 0.0
                    cell.viewLeftMargin = 0.0
                    cell.viewTopMargin = 0.0
                    cell.viewBottomMargin = 0.0
                    
                    //  Define the cell's height
                    cell.height = { return CGFloat(300) }
                }
            
                <<< LabelRow() { (row) in
                    row.title = "Another Row"
                    row.value = "Hello Again"
                }
    }
}
