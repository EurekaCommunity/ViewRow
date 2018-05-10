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
                    cell.view!.contentMode = .scaleAspectFill
                    cell.view!.clipsToBounds = true

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
                    cell.view = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 300))
                    cell.view!.contentMode = .scaleAspectFill
                    cell.view!.clipsToBounds = true

                    //  Get something to display
                    let image = UIImage(named: "trees")
                    cell.view!.image = image
                    
                    //  Make the image view occupy the entire row:
                    cell.viewRightMargin = 0.0
                    cell.viewLeftMargin = 0.0
                    cell.viewTopMargin = 0.0
                    cell.viewBottomMargin = 0.0
                }
            
                <<< LabelRow() { (row) in
                    row.title = "Another Row"
                    row.value = "Hello Again"
                }

            +++ Section("Image View with changable image")
            
                <<< SegmentedRow<String> { (row) in
                    row.title = "Image"
                    row.options = ["trees", "flower"]
                    row.value = "trees"
                }
                .cellSetup { (cell, row) in
                    cell.segmentedControl.setContentHuggingPriority(UILayoutPriority(rawValue: 750), for: .horizontal)
                    cell.segmentedControl.apportionsSegmentWidthsByContent = true
                }
                .onChange { [unowned self] (row) in
                    guard let imageName = row.value else { return }
                    guard let imageRow = self.form.rowBy(tag: "xxxx") as? ViewRow<UIImageView> else { return }
                    
                    let image = UIImage(named: imageName)
                    imageRow.cell.view!.image = image
                }

                <<< ViewRow<UIImageView>("xxxx")
                .cellSetup { (cell, row) in
                    //  Construct the view for the cell
                    cell.view = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 300))
                    cell.view!.contentMode = .scaleAspectFill
                    cell.view!.clipsToBounds = true
                    
                    //  Get something to display
                    let image = UIImage(named: "trees")
                    cell.view!.image = image
                    
                    //  Make the image view occupy the entire row:
                    cell.viewRightMargin = 0.0
                    cell.viewLeftMargin = 0.0
                    cell.viewTopMargin = 0.0
                    cell.viewBottomMargin = 0.0
                }
    }
}
