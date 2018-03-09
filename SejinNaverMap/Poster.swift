//
//  Poster.swift
//  SejinNaverMap
//
//  Created by 3zin on 2018. 2. 26..
//  Copyright © 2018년 3zin. All rights reserved.
//
//  Poster section

import UIKit

class Poster: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //delegate 1 : 섹션 개수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posterName.count
    }
    
    //delegate 2 : 화면에 띄울 셀 <- PosterCell(our customcell) 뿌리기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //여기서 collectionView는 매개변수
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        
        cell.posterLableView.text = posterName[indexPath.item]
        cell.posterImageView.image = posterImage[indexPath.item]
        return cell
    }
    

    @IBOutlet weak var posterView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterView.delegate = self
        posterView.dataSource = self
        
        // Do any additional setup after loading the view.
        self.addSlideMenuButton()
        self.title = "Poster"
        
    }
    
    // 클릭시 full screen
    // * 이 메소드는 collectionview가 select 되었을 때 실행됨
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //PosterCell(Custom Cell) type으로 selected cell을 받아온다
        let cell = collectionView.cellForItem(at: indexPath) as! PosterCell
        
        //새롭게 subview로 띄울 ImageView
        let newImageView:UIImageView = UIImageView(image: cell.posterImageView.image)
        
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        
        //Tab이 들어오면 반응하도록 설정
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //Tab이 들어오면 subview remove
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
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
