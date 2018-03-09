//
//  MapViewController.swift
//  SejinNaverMap
//
//  Created by 3zin on 2018. 2. 25..
//  Copyright © 2018년 3zin. All rights reserved.
//
//  지도 menu
//  Naver 지도 API 사용
//  https://developers.naver.com/docs/map/ios/
//  https://developers.naver.com/docs/map/tutorial/#section-Tutorial_ios6

import UIKit

class MapViewController: BaseViewController, NMapViewDelegate, NMapPOIdataOverlayDelegate {
    
    var mapView: NMapView? //지도 데이터를 화면에 표시하는 view class
    
    @IBOutlet var mainView: UIView! // main view <- 이후에 네이버 지도 subview로 교체
    
    // 마커 클릭시 팝업되는 calloutView
    @IBOutlet var calloutView: UIView!
    @IBOutlet weak var calloutLabel: UILabel!
    @IBOutlet weak var calloutImage: UIImageView!
    @IBOutlet weak var calloutAddress: UILabel!
    @IBOutlet weak var calloutPhone: UILabel!
    @IBOutlet weak var calloutText: UILabel!
    
    override func viewDidLoad() { //view controller 실행 시 한 번 실행되는 함수 (~~DidLoad)
        super.viewDidLoad()
        mapView = NMapView(frame: self.view.frame)//init
        //self.navigationController?.navigationBar.isTranslucent = false
        
        if let mapView = mapView {
            // set the delegate for map view
            mapView.delegate = self
            
            // set the application api key for Open MapViewer Library
            mapView.setClientId("cB0sp8STTytmuBu5JHlK")
            mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                
            view.addSubview(mapView)
            
        }
        self.addSlideMenuButton()//add button
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mapView?.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mapView?.viewDidAppear()
        showMarkers()//view가 load된 직후에 마커를 등장시킨다
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        mapView?.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        mapView?.viewDidDisappear()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        mapView?.didReceiveMemoryWarning()
    }
    
    //지도 초기화시 호출되는 함수. 정상일 경우 error==nil
    public func onMapView(_ mapView: NMapView!, initHandler error: NMapError!) {
        if (error == nil) { // success
            // set map center and level
            mapView.setMapCenter(NGeoPoint(longitude:126.978371, latitude:37.5666091), atLevel:11)
            
            // set for retina display
            mapView.setMapEnlarged(true, mapHD: true)
            
            // set map mode : vector/satelite/hybrid
            mapView.mapViewMode = .vector
            
        } else { // fail
            print("onMapView:initHandler: \(error.description)")
        }
    }
    
    
    
    // MARK: - NMapPOIdataOverlayDelegate
    
    //마커에 해당하는 이미지 반환
    open func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, imageForOverlayItem poiItem: NMapPOIitem!, selected: Bool) -> UIImage! {
        return NMapViewResources.imageWithType(poiItem.poiFlagType, selected: selected)
    }
    
    //마커의 위치
    open func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, anchorPointWithType poiFlagType: NMapPOIflagType) -> CGPoint {
        return NMapViewResources.anchorPoint(withType: poiFlagType)
    }
    
    //마커 클릭시 말풍선의 상대 위치
    open func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, calloutOffsetWithType poiFlagType: NMapPOIflagType) -> CGPoint {
        return CGPoint(x: 0.5, y: 5.0)
    }
    
    //마커 선택 시의 말풍선을 이미지로 반환 - 사용하지 않음 <- return nil
    open func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, imageForCalloutOverlayItem poiItem: NMapPOIitem!, constraintSize: CGSize, selected: Bool, imageForCalloutRightAccessory: UIImage!, calloutPosition: UnsafeMutablePointer<CGPoint>!, calloutHit calloutHitRect: UnsafeMutablePointer<CGRect>!) -> UIImage! {
        return nil
    }
    
    
    //마커 선택 시의 말풍선을 view로 반환
    func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, viewForCalloutOverlayItem poiItem: NMapPOIitem!, calloutPosition: UnsafeMutablePointer<CGPoint>!) -> UIView! {
        
        //index에 맞는 정보와 사진을 받아온다
        
        //calloutView.layer.borderWidth = 1.5
        calloutView.layer.cornerRadius = 7
        //calloutView.layer.borderColor = UIColor.black.cgColor
        
        calloutPosition.pointee.x = round(calloutView.bounds.size.width / 2) + 1
        calloutLabel.text = poiItem.title
        
        calloutAddress.numberOfLines = 0 //줄 길이 무제한 + 자동 줄바꿈 허용
        calloutAddress.lineBreakMode = NSLineBreakMode.byWordWrapping
        calloutAddress.text = "주소 / " + (poiItem.object as! Store).address!
        
        calloutPhone.numberOfLines = 0
        calloutPhone.lineBreakMode = NSLineBreakMode.byWordWrapping
        calloutPhone.text = "Tel / " + (poiItem.object as! Store).phone!
        
        calloutText.numberOfLines = 0
        calloutPhone.lineBreakMode = NSLineBreakMode.byWordWrapping
        calloutText.text = "한줄평 / " + (poiItem.object as! Store).text!
        
        //index에 맞는 정보와 사진을 받아온다
        //이런 방식이 일반적인가..?
        let info:String = "store_" + String(poiItem.iconIndex+1)
        let image:UIImage = UIImage(named: info)!//Assets.xcassets가 기본 bundle 경로인 듯? 추가적인 설정 필요 없음
        calloutImage.image = image
        
        //정보 받아오기
        
        return calloutView
        
    }
    
    
    
    // MARK : Marker control
    
    func showMarkers() {
        
        if let mapOverlayManager = mapView?.mapOverlayManager {
            
            // create POI data overlay
            if let poiDataOverlay:NMapPOIdataOverlay = mapOverlayManager.newPOIdataOverlay() {
                
                poiDataOverlay.initPOIdata(10)
                
                //storeCenter 에서 정보를 받아와서 마커에 뿌린다
                for (index, store) in storeCenter.stores.enumerated(){
                    poiDataOverlay.addPOIitem(atLocation: NGeoPoint(longitude: (store.place_info?.longitude)!, latitude: (store.place_info?.latitude)!), title: store.title, type: UserPOIflagTypeDefault, iconIndex: Int32(index), with: store)
                }
                
                poiDataOverlay.endPOIdata()
                
                // show all POI data
                // atLevel:0 -> 모든 마커가 보이도록 초기 화면 설정
                poiDataOverlay.showAllPOIdata(atLevel:0)
                
               // poiDataOverlay.selectPOIitem(at: 2, moveToCenter: false, focusedBySelectItem: true)
                
            }
        }
    }
    
    func clearOverlays() {
        if let mapOverlayManager = mapView?.mapOverlayManager {
            mapOverlayManager.clearOverlays()
        }
    }
    

    // MARK: - Map Mode Segmented Control
    // 지도 모드 변경 (일반-위성-하이브리드)
    
    @IBAction func modeChange(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            mapView?.mapViewMode = .vector
        case 1:
            mapView?.mapViewMode = .satellite
        case 2:
            mapView?.mapViewMode = .hybrid
        default:
            mapView?.mapViewMode = .vector
        }
    }
    
}






