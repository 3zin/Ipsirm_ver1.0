//
//  PosterCell.swift
//  SejinNaverMap
//
//  Created by 3zin on 2018. 2. 26..
//  Copyright © 2018년 3zin. All rights reserved.
//
//  Poster Cells
//  * Collection View에서 굳이 custom cell을 만들지 않고 imageview에 접근 할 수 있는 방안은 뭐가 있을까?

import UIKit

class PosterCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var posterLableView: UILabel!

}

