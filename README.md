By [Mark Alldritt](http://markalldritt.com).

## Introduction

ViewRow is a [Eureka](https://github.com/xmartlabs/Eureka) row that allows you to display any UIView (or UIView sunclass) within a Eureka row.  Views can be created in code or loaded from nib files.

![Demo](Screenshots/ViewRow.gif)

## ViewRow Usage

### Create view in code

```swift
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        form
            +++ Section("ViewRow Demo")
                <<< ViewRow<MyView>("view") { (row) in
                    row.title = "My View Title" // optional
                }
                .cellSetup { (cell, row) in
                    //  Construct the view for the cell
                    cell.view = MyView()
                    cell.view?.backgroundColor = UIColor.orange
                    cell.contentView.addSubview(cell.view!)
                    
                    //  Define the cell's height
                    cell.height = { return CGFloat(200) }
                }
    }
}
```

### Load view from a nib file

```swift
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        form
            +++ Section("ViewRow Demo")
                <<< ViewRow<MyView>("view") { (row) in
                    row.title = "My View Title" // optional
                }
                .cellSetup { (cell, row) in
                    //  Construct the view
                    let bundle = Bundle.main
                    let nib = UINib(nibName: "MyView", bundle: bundle)
                    
                    cell.view = nib.instantiate(withOwner: self, options: nil)[0] as? MyView
                    cell.view?.backgroundColor = cell.backgroundColor
                    cell.contentView.addSubview(cell.view!)
                                        
                    //  Define the cell's height
                    cell.height = { return CGFloat(200) }
                }
    }
}
```


## Requirements

* iOS 10.0+
* Xcode 8.3+
* Eureka 3.0.*

## Getting involved

* If you **want to contribute** please feel free to **submit pull requests**.
* If you **have a feature request** please **open an issue**.
* If you **found a bug** or **need help** please **check older issues, [FAQ](#faq) before submitting an issue.**.

Before contribute check the [CONTRIBUTING](https://github.com/EurekaCommunity/ImageRow/blob/master/CONTRIBUTING.md) file for more info.

If you use **ViewRow** in your app I would love to hear about it! Drop me a line on [twitter](https://twitter.com/alldritt).


## Installation

1. Add `pod 'ViewRow', :git => 'https://github.com/EurekaCommunity/ViewRow'` to your Podfile
2. Run `$ pod install`


## ViewRow Customization

The following properties control the placement of the title and view within the row: 

  `viewRightMargin`  
  `viewLeftMargin`  
  `viewTopMargin`  
  `viewBottomMargin`
    
  `titleLeftMargin`  
  `titleRightMargin`  
  `titleTopMargin`  
  `titleBottomMargin`  

If the value of the row's `title` property is nil or blank, the title portion of the view is hidden.

## Author

- [Mark Alldritt](http://markalldritt.com)

## FAQ

nothing yet
