//
//  ViewRow.swift
//  CustomViewRow
//
//  Created by Mark Alldritt on 2017-09-13.
//  Copyright © 2017 Late Night Software Ltd. All rights reserved.
//

import UIKit
import Eureka


public class ViewCell<ViewType : UIView> : Cell<String>, CellType {
    
    public var view : ViewType?
    
    public var viewRightMargin = CGFloat(15.0)
    public var viewLeftMargin = CGFloat(15.0)
    public var viewTopMargin = CGFloat(1.0)
    public var viewBottomMargin = CGFloat(1.0)
    
    public var titleLeftMargin = CGFloat(15.0)
    public var titleRightMargin = CGFloat(5.0)
    public var titleTopMargin = CGFloat(12.0)
    public var titleBottomMargin = CGFloat(4.0)

    fileprivate var titleLabel : UILabel?
    
    private var notificationObserver : NSObjectProtocol?

    required public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        if let notificationObserver = notificationObserver {
            NotificationCenter.default.removeObserver(notificationObserver)
        }
    }
    
    open override func setup() {
        super.setup()
        
        titleLabel = UILabel(frame: CGRect.zero)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        contentView.addSubview(titleLabel!)
        
        notificationObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIContentSizeCategoryDidChange,
                                                                      object: nil,
                                                                      queue: nil,
                                                                      using: { [weak self] (note) in
                                                                        self?.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
                                                                        self?.setNeedsLayout()
        })

        selectionStyle = .none
    }
    
    open override func didSelect() {
    }
    

    open override func layoutSubviews() {
        super.layoutSubviews()
        
        //  This could be done with autolayout, but this seems simpler...
        let contentFrame = contentView.frame

        if titleLabel!.text == nil || titleLabel!.text == "" {
            titleLabel!.frame = CGRect.zero
            view?.frame = CGRect(x: viewLeftMargin,
                                 y: viewTopMargin,
                                 width: contentFrame.width - viewLeftMargin - viewRightMargin,
                                 height: contentFrame.height - viewTopMargin - viewBottomMargin)
        }
        else {
            let titleSize = titleLabel!.sizeThatFits(CGSize(width: contentFrame.width - titleLeftMargin - titleRightMargin, height: 9999.0))
            
            titleLabel!.frame = CGRect(x: titleLeftMargin,
                                       y: titleTopMargin,
                                       width: contentFrame.width - titleLeftMargin - titleRightMargin,
                                       height: titleSize.height)
            view?.frame = CGRect(x: viewLeftMargin,
                                 y: titleLabel!.frame.maxY + titleBottomMargin + viewTopMargin,
                                 width: contentFrame.width - viewLeftMargin - viewRightMargin,
                                 height: contentFrame.height - titleLabel!.frame.maxY - viewTopMargin - titleBottomMargin - viewBottomMargin)
        }
        
    }
    
}

// MARK: ViewRow

open class _ViewRow<ViewType : UIView>: Row<ViewCell<ViewType> > {
    
    override open func updateCell() {
        cell.titleLabel?.text = title
    }
    
    required public init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
    }
}

public final class ViewRow<ViewType : UIView>: _ViewRow<ViewType>, RowType {

    public var view: ViewType? { // provide a convience accessor for the view
        return cell.view
    }
    
    required public init(tag: String?) {
        super.init(tag: tag)
    }

}
