//
//  FoodData.swift
//  SejinNaverMap
//
//  Created by 3zin on 2018. 2. 25..
//  Copyright © 2018년 3zin. All rights reserved.
//

import Foundation

// MapViewController 내부 marker 에 spread 할 음식점 정보를 저장하는 data source 클래스

class StoreCenter{
    var stores:[Store] = []
    
    init(){
        let store_1 = Store(title: "두리반", address: "서울 마포구 홍익로5길 45", phone: "02-333-4113", place_info: Place(longitude: 126.9202160,latitude: 37.5531360), text:"당신은 칼국수나 만들어")
        let store_2 = Store(title: "청정옥", address: "서울 성동구 상원길 19", phone: "02-468-3800", place_info: Place(longitude: 127.0489320, latitude: 37.5458810), text:"맛있다")
        let store_3 = Store(title: "유니통닭", address: "서울 서초구 방배로 83-18", phone: "02-588-8316", place_info: Place(longitude: 126.9963490, latitude: 37.4823080), text:"방배역이 아니라 유니통닭역")
        let store_4 = Store(title: "단바쿠라멘", address: "서울 서초구 효령로31길 86", phone: "070-4100-9942", place_info: Place(longitude: 126.9946980, latitude: 37.4847780), text:"아카라멘 요와카라 히토츠")
        let store_5 = Store(title: "다리원", address: "서울 서초구 효령로 105", phone: "02-522-7275", place_info: Place(longitude: 126.9956700, latitude: 37.4810620), text:"탕수육 밑에 깔린 또띠아가 메인")
        let store_6 = Store(title: "연어&멘", address: "서울 양천구 목동로21길 1", phone: "02-2694-9933", place_info: Place(longitude: 126.8636090, latitude: 37.5253490), text:"맛있다")
        let store_7 = Store(title: "방이샤브샤브칼국수", address: "서울 송파구 오금로31길 42", phone: "02-423-3450", place_info: Place(longitude: 127.1233370, latitude: 37.5092480), text:"맛있다")
        let store_8 = Store(title: "한우정육식당", address: "서울 서초구 방배로 116", phone: "?", place_info: Place(longitude: 126.9958950, latitude: 37.4845530), text:"아빠랑 가면 대박")
        let store_9 = Store(title: "양천뼈다귀", address: "서울 양천구 목동동로 258", phone: "02-2642-5200", place_info: Place(longitude: 126.8747090, latitude: 37.5253030), text:"맛있다")
        let store_10 = Store(title: "북창동순두부", address: "서울 양천구 목동서로 155", phone: "02-2653-3660", place_info: Place(longitude: 126.8751260, latitude: 37.5293140), text:"맛있다")
        let store_11 = Store(title: "유가복", address: "인천 중구 차이나타운로 37-4", phone: "032-765-8875", place_info: Place(longitude: 126.61973600, latitude: 37.4759100), text:"맛있다")
        let store_12 = Store(title: "추억속으로", address: "인천 중구 월미로 256", phone: "032-777-7796", place_info: Place(longitude: 126.5982890, latitude: 37.4733830), text:"맛있다")
        let store_13 = Store(title: "오목집", address: "서울 양천구 목동서로 155", phone: "02-6737-6692", place_info: Place(longitude: 126.8751260, latitude: 37.5293140), text:"맛있다")
        let store_14 = Store(title: "보신탕의명가유정", address: "서울 은평구 통일로 715-12", phone: "02-744-5777", place_info: Place(longitude: 126.9295330, latitude: 37.6099130), text:"반려동물을 사랑합시다")
        
        
        
        stores += [store_1, store_2, store_3, store_4, store_5, store_6, store_7, store_8, store_9, store_10, store_11, store_12, store_13, store_14]
    }
}

struct Place{
    let longitude:Double?
    let latitude:Double?
    
    init(longitude:Double, latitude:Double){
        self.longitude = longitude
        self.latitude = latitude
    }
}

class Store{
    let title:String? //가게 이름
    let address:String? //가게 주소
    let phone:String? //전화번호
    let place_info:Place? //위도경도
    let text:String? //후기
    
    
    init(title:String, address:String, phone:String, place_info:Place, text:String){
        self.title = title
        self.address = address
        self.place_info = place_info
        self.phone = phone
        self.text = text
    }
}

let storeCenter:StoreCenter = StoreCenter() //정보는 여기에
