//
//  HistoryView.swift
//  SejinNaverMap
//
//  Created by 3zin on 2018. 3. 26..
//  Copyright © 2018년 3zin. All rights reserved.
//
//  History로부터 modal view의 형식으로 pop up 되는 새로운 뷰
//  탭이 들어오면 종료된다
//  최대한 hard coding을 지양하는 방식으로 각각의 label을 지정했다

import UIKit

class HistoryView: BaseViewController{
    
    
    @IBOutlet var book_image: UIImageView!
    @IBOutlet var book_title_writer: UILabel!
    @IBOutlet var book_pub_date: UILabel!
    @IBOutlet var book_price: UILabel!
    @IBOutlet var book_line: UILabel!
    @IBOutlet var book_comment: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = param?.title
        self.navigationController?.isNavigationBarHidden = true
        

        // book_image 처리
        // 사진의 비율에 맞춰 동적인 size 조절이 가능하게 했다
        if let img = param?.image{
            book_image.image = img
            
            // 원래 이미지의 절대 width, height
            let img_width = img.size.width
            let img_height = img.size.height
            
            // width를 화면의 1/2로 놓고, height는 이미지의 원래 사이즈에 따라 유동적으로 처리한다.
            book_image.frame = CGRect(x: 0, y: 0, width: self.view.frame.width/2, height: self.view.frame.width/2 * img_height/img_width)
            book_image.center = CGPoint(x: self.view.frame.width/2, y: book_image.frame.height/2+50)
        }
        
        
        // book_title_writer 처리
        book_title_writer.frame = CGRect(x: 0, y: book_image.frame.origin.y+book_image.frame.height+40, width: self.view.frame.width, height: 20)
        
        // Book.writer optional binding
        if let writer = param?.writer{
            book_title_writer.text = (param?.title)! + " (" + writer + ")"
        }else{
            book_title_writer.text = (param?.title)!
        }
        
        // book_pub_date 처리
        book_pub_date.frame = CGRect(x: 0, y: book_title_writer.frame.origin.y + book_title_writer.frame.height+10, width: self.view.frame.width, height: 20)
        
        // Book.date_pb, Book.publisher optional binding
        if let date = param?.date_pb{
            if let publisher = param?.publisher{
                book_pub_date.text = (publisher) + ", " + "\(date)"
            }else{
                book_pub_date.text = "\(date)"
            }
        }else{
            if let publisher = param?.publisher{
                book_pub_date.text = (publisher)
            }else{
                book_pub_date.text = "???"
            }
        }
        
        
        // book_price 처리
        book_price.frame = CGRect(x: 0, y: book_pub_date.frame.origin.y + book_pub_date.frame.height+10, width: self.view.frame.width, height: 20)
        
        // Book.price optional binding
        if let price = param?.price{
            book_price.text = "\(price)원"
        }else{
            book_price.text = " "
        }
        
        // book_line 처리
        book_line.frame = CGRect(x: 0, y: book_price.frame.origin.y + book_price.frame.height+10, width: self.view.frame.width, height: 20)
        
        
        // book_comment 처리
        book_comment.frame = CGRect(x: 30, y: book_line.frame.origin.y + book_line.frame.height+20, width:self.view.frame.width-60, height:200)
        book_comment.text = ""
        
        // Book.param optional binding
        if let comments = param?.comment{
            // 이름(key) 순으로 내림차순 정렬
            // sorted_comments는 딕셔너리가 아닌 튜플(key, value)의 배열로 저장된다.
            let sorted_comments = comments.sorted{(c1, c2) -> Bool in
                return c1.key < c2.key
            }
            
            // 별점에 맞는 별 사진을 xcassets에서 불러와서 label 내에 간편하게 붙여넣을 수 있도록
            // NSMutableAttributedString과 NSTextAttachment를 사용했다
            let txt = NSMutableAttributedString()
            
            for (key, value) in sorted_comments{
                let point = Float(value[0])
                if let point = point{
                    // 0.5 단위로 반올림
                    let rounded = (point*2).rounded()/2.0
                    txt.append(NSAttributedString(string: key + " (" + value[0] + ") "))
                    let stars = NSTextAttachment()
                    stars.image = UIImage(named: "star_" + String(rounded))
                    stars.bounds = CGRect(x: 0, y: -5, width: 80, height: 21)
                    txt.append(NSAttributedString(attachment: stars))
                    txt.append(NSAttributedString(string: "\n　　　 " + value[1] + "\n"))
                }
            }
            book_comment.attributedText = txt
        }
        
        // 탭이 들어올 경우 pop out 하도록 설정
        self.view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(popOut))
        self.view.addGestureRecognizer(tap)
    }
    
    // pop out
    @objc func popOut(_ sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // History부터 전달받은 책 내용
    var param:Book?
    
    // 왼쪽 위 정렬 (왜 이런 방식으로?)
    override func viewDidLayoutSubviews() {
        book_comment.sizeToFit()
    }
}
