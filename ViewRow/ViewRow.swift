//
//  ViewRow.swift
//  CustomViewRow
//
//  Created by Mark Alldritt on 2017-09-13.
//  Copyright © 2017 Late Night Software Ltd. All rights reserved.
//

import UIKit
import Eureka


public class ViewCell<ViewType : UIView, ValueType : Equatable> : Cell<ValueType>, CellType {
    
    public var view : ViewType?
    
    public var viewRightMargin = CGFloat(15.0)
    public var viewLeftMargin = CGFloat(15.0)
    public var viewTopMargin = CGFloat(1.0)
    public var viewBottomMargin = CGFloat(1.0)
    
    public var titleLeftMargin = CGFloat(15.0)
    public var titleRightMargin = CGFloat(5.0)
    public var titleTopMargin = CGFloat(12.0)
    public var titleBottomMargin = CGFloat(4.0)

    public var titleLabel : UILabel?
    
    private var notificationObserver : NSObjectProtocol?

    required public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
        
        //  Provide a default row height calculation based on the height of the assigned view.
        height = {
            if self.titleLabel!.text == nil || self.titleLabel!.text == "" {
                return ceil((self.view?.frame.height ?? 0) + self.viewTopMargin + self.viewBottomMargin)
            }
            else {
                let titleHeight = ceil(self.titleLabel!.sizeThatFits(CGSize(width: self.contentView.frame.width - self.titleLeftMargin - self.titleRightMargin, height: 9999.0)).height)

                return ceil(titleHeight + self.titleTopMargin + self.titleBottomMargin + (self.view?.frame.height ?? 0.0) + self.viewTopMargin + self.viewBottomMargin)
            }
        }
        
        notificationObserver = NotificationCenter.default.addObserver(forName: UIContentSizeCategory.didChangeNotification,
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
            let titleHeight = ceil(titleLabel!.sizeThatFits(CGSize(width: contentFrame.width - titleLeftMargin - titleRightMargin, height: 9999.0)).height)
            let titleFrame = CGRect(x: titleLeftMargin,
                                    y: titleTopMargin,
                                    width: contentFrame.width - titleLeftMargin - titleRightMargin,
                                    height: titleHeight)
            let viewFrame = CGRect(x: viewLeftMargin,
                                   y: titleFrame.maxY + titleBottomMargin + viewTopMargin,
                                   width: contentFrame.width - viewLeftMargin - viewRightMargin,
                                   height: ceil(contentFrame.height - titleFrame.maxY - titleBottomMargin - viewTopMargin - viewBottomMargin))
            
            titleLabel!.frame = titleFrame
            view?.frame = viewFrame
        }
    }
    
}

// MARK: ViewRow

open class _ViewRow<ViewType : UIView, ValueType : Equatable>: Row<ViewCell<ViewType, ValueType> > {
    
    override open func updateCell() {
        //  NOTE: super.updateCell() deliberatly not called.
        
        //  Deal with the case where the caller did not add their custom view to the containerView in a
        //  backwards compatible manner.
        if let view = cell.view,
            view.superview != cell.contentView {
            view.removeFromSuperview()
            cell.contentView.addSubview(view)
        }
        cell.titleLabel?.text = title
    }
    
    required public init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
    }
}

// ViewRow class with value type specialization.  When/if Swift allows default values for generics this can be folded
// into the ViewRow class.
public final class ViewRowGeneric<ViewType : UIView, ValueType : Equatable>: _ViewRow<ViewType, ValueType>, RowType {

    public var view: ViewType? { // provide a convience accessor for the view
        return cell.view
    }
    
    required public init(tag: String?) {
        super.init(tag: tag)
    }

}

// legacy ViewRow class without value type specialization
public final class ViewRow<ViewType : UIView> : _ViewRow<ViewType, String>, RowType {
    
    public var view: ViewType? { // provide a convience accessor for the view
        return cell.view
    }
    
    required public init(tag: String?) {
        super.init(tag: tag)
    }

}
