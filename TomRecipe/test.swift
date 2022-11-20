//
//  test.swift
//  TomRecipe
//
//  Created by 1 on 2022/11/19.
//

import UIKit


class BroadLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width + 50, height: super.intrinsicContentSize.height)
    }
}


class BroadButton: UIButton {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width, height: super.intrinsicContentSize.height + 50)
    }
}
