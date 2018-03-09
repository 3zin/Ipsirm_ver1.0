//
//  Photos.swift
//  SejinNaverMap
//
//  Created by 3zin on 2018. 3. 5..
//  Copyright © 2018년 3zin. All rights reserved.
//
//  Photo section

import UIKit
import AudioToolbox

class Photo: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //delegate : 섹션 개수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoImage.count
    }
    
    
    //delegate : 화면에 띄울 셀 <- PhotoCell(our customcell) 뿌리기
    // * 왜 reuseidentifier를 지정 안해도 되지...??
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        cell.photoImageView.image = photoImage[indexPath.item]
        return cell
    }
    
    
    //delegate : 화면에 띄울 셀의 크기 동적 조정 (가로 세로 비율을 사용해서 임시방편으로 맞춤) -> 추후에는 Dynamic self-sizing으로..
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let image = photoImage[indexPath.item]
        
        let height = image.size.height
        let width = image.size.width
        let custom_w = UIScreen.main.bounds.width + 150
        
        let new_img = CGSize(width: width/(height+width) * custom_w, height: height/(height+width) * custom_w)
        return new_img
    }
    
    
    // delegate : 상하좌우 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let customInset:UIEdgeInsets = UIEdgeInsetsMake(0, 0, 50, 0)
        return customInset
    }
    
    
    // delegate : 셀 사이 가로 최소 여백(의도적으로 one column으로 설정)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10000
    }
    
    
    // delegate : 셀 사이 세로 최소 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    
    @IBOutlet weak var photoView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoView.delegate = self
        photoView.dataSource = self

        // Do any additional setup after loading the view.
        self.addSlideMenuButton()
        self.title = "Photo"
        
    }
    
    // 클릭할 때 새롭게 화면에 subview로 뿌릴 scrollview와 imageview
    var custom_img: UIImageView!
    var newScrollView: UIScrollView!
    
    
    
    // 클릭시 full screen & 핀치 확대
    // * 이 메소드는 collectionview가 select 되었을 때 실행됨
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // PosterCell(Custom Cell) type으로 selected cell을 받아온다
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCell
        
        // 새롭게 subview로 띄울 ScrollView와 ImageView 제작
        newScrollView = UIScrollView()
        newScrollView.delegate = self
        newScrollView.frame = UIScreen.main.bounds //self.view.frame으로 해도 아마 될듯?
        newScrollView.backgroundColor = .black
        newScrollView.contentMode = .scaleAspectFit // 비율 일정하게 유지
        newScrollView.isUserInteractionEnabled = true //default value is true
        
        newScrollView.flashScrollIndicators() //bring scroll view to the front
        
        newScrollView.minimumZoomScale = 1.0
        newScrollView.maximumZoomScale = 5.0 // maximumZoomScale 설정 안할 시 zoom 이후 다시 원래대로 돌아가게 됨
        
        // SingleTap이 들어오면 창 닫기
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newScrollView.addGestureRecognizer(tap)
        
        // long press가 들어오면 사진 저장
        let longtap = UILongPressGestureRecognizer(target: self, action: #selector(downloadImage))
        longtap.minimumPressDuration = 0.5
        newScrollView.addGestureRecognizer(longtap)
        
        self.view.addSubview(newScrollView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        // scrollview위에 뿌릴 imageview
        custom_img = UIImageView(image:cell.photoImageView.image)
        custom_img.frame = UIScreen.main.bounds
        custom_img.contentMode = .scaleAspectFit
        custom_img.clipsToBounds = false //default value is false
        
        newScrollView.addSubview(custom_img)
        
    }
    
    
    // Zoom의 대상이 되는 적당한 imageview 제공. Return값이 nil이면 zooming이 일어나지 않음.
    // 내부적인 과정은 자동인 것 같지만, 일단 scrollview의 subview로 되어 있는 적절하게 세팅된 imageview가 필요함
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
       return self.custom_img
    }
    
    
    // Tab이 들어오면 subview remove
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    // Long Press가 들어오면 image download
    // ActionSheet으로 저장할 지 안할 지 정할 수 있도록 했음
    @objc func downloadImage(_ sender: UILongPressGestureRecognizer) {
        
        // short vibration
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // Closure for downloading image
        let downloadAction = UIAlertAction(title: "Download", style: .default){(action) in
            UIImageWriteToSavedPhotosAlbum(self.custom_img.image!, self, #selector(self.image), nil)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel,handler : nil)
        
        alert.addAction(downloadAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    
    // 혹시 예외처리가 필요할 경우 사용하면 됨
    // gesture에 @objc가 뜨는 이유 -> gesture controller가 objc로 작성되었기 때문.. 별 거 아님
    @objc func image(image: UIImage!, didFinishSavingWithError error: NSError!, contextInfo: AnyObject!) {
        if (error != nil) {
            // Something wrong happened.
        } else {
            // Everything is alright.
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
