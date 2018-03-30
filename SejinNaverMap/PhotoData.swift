//
//  PhotoData.swift
//  SejinNaverMap
//
//  Created by 3zin on 2018. 3. 5..
//  Copyright © 2018년 3zin. All rights reserved.
//

import Foundation

// Photo 내부 CollectionViewController에 spread 할 사진 정보를 저장하는 data source 클래스

class PhotoData{

    var photoImage:[UIImage] = []

    init(){
        for index in (1...95) {
            photoImage.append(UIImage(named:"photo_" + String(index))!)
        }
    }
}

// 사진 데이터는 여기에
let photos = PhotoData()
