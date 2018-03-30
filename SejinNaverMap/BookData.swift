//
//  BookData.swift
//  SejinNaverMap
//
//  Created by 3zin on 2018. 3. 10..
//  Copyright © 2018년 3zin. All rights reserved.
//

import Foundation

// History 내부 TableViewController에 spread 할 책 정보를 저장하는 data source 클래스

class BookDataCenter{
    
    var bookData = [[Book]]()
    
    init(){
        
        // 2015년도
        
        let book_1 = Book(title: "변신", writer: "프란츠 카프카", publisher: "민음사", date_ip: "201507XX", date_pb: 1915, price: 8500, comment: nil, image:UIImage(named: "book_1")!)
        
        let book_2 = Book(title: "무진기행", writer: "김승옥", publisher: "문학동네", date_ip: "201507XX", date_pb: 1964, price: 13000, comment: nil, image:UIImage(named: "book_2")!)
        
        let book_3 = Book(title: "내 인생의 가사", writer: nil, publisher: nil, date_ip: "201507XX", date_pb: nil, price: nil, comment: nil,image:UIImage(named: "book_3")!)
        
        let book_4 = Book(title: "시를 좋아하게 될거야", writer: nil, publisher: nil, date_ip: "201507XX", date_pb: nil, price: nil, comment: nil, image:UIImage(named: "book_4")!)
        
        let book_5 = Book(title: "위대한 개츠비", writer: "F. 스콧 피츠제럴드", publisher: "민음사", date_ip: "201508XX", date_pb: 1925, price: 8000, comment: nil,image:UIImage(named: "book_5")!)
        
        let book_6 = Book(title: "미드나잇 인 파리", writer: "우디 앨런", publisher: nil, date_ip: "201508XX", date_pb: 2012, price: nil, comment: nil, image:UIImage(named: "book_6")!)
        
        let book_7 = Book(title: "신경숙 표절 사건", writer: nil, publisher: nil, date_ip: "201508XX", date_pb: nil, price: nil, comment: nil,image:UIImage(named: "book_7")!)
        
        let book_8 = Book(title: "무슨 일이 일어났는지는 아무도", writer: "김영하", publisher: "문학동네", date_ip: "201508XX", date_pb: 2010, price: 10000, comment: nil, image:UIImage(named: "book_8")!)
        
        let book_9 = Book(title: "파이트 클럽", writer: "데이빗 핀처", publisher: nil, date_ip: "201509XX", date_pb: 1999, price: nil, comment: nil, image:UIImage(named: "book_9")!)
        
        let book_10 = Book(title: "대성당", writer: "레이먼드 카버", publisher: "문학동네", date_ip: "201509XX", date_pb: 1983, price: 14500, comment: nil, image:UIImage(named: "book_10")!)
        
        let book_11 = Book(title: "다섯째 아이", writer: "도리스 레싱", publisher: "민음사", date_ip: "201509XX", date_pb: 1988, price: 7000, comment: nil, image:UIImage(named: "book_11")!)
        
        let book_12 = Book(title: "저녁의 구애", writer: "편혜영", publisher: "문학과 지성사", date_ip: "201509XX", date_pb: 2011, price: 11000, comment: nil, image:UIImage(named: "book_12")!)
        
        let book_13 = Book(title: "술꾼", writer: "최인호", publisher: "동아", date_ip: "201510XX", date_pb: 1970, price: 3500, comment: nil, image:UIImage(named: "book_13")!)
        
        let book_14 = Book(title: "강", writer: "서정인", publisher: "문학과 지성사", date_ip: "201510XX", date_pb: 1968, price: 11000, comment: nil, image:UIImage(named: "book_14")!)
        
        let book_15 = Book(title: "사랑의 기하학", writer: "존 치버", publisher: "문학동네", date_ip: "201511XX", date_pb: 1978, price: 15500, comment: nil, image:UIImage(named: "book_15")!)
        
        let book_16 = Book(title: "입 속의 검은 잎", writer: "기형도", publisher: "문학과 지성사", date_ip: "201511XX", date_pb: 1989, price: 8000, comment: nil, image:UIImage(named: "book_16")!)
        
        // 2016년도
        
        // 2017년도
        
        let book_17 = Book(title: "유년의 뜰", writer: "오정희", publisher: "문학과 지성사", date_ip: "20170208", date_pb: 1981, price: 11000, comment: nil, image:UIImage(named: "book_17")!)
        
        let book_18 = Book(title: "에듀케이션", writer: "김승일", publisher: "문학과 지성사", date_ip: "20170301", date_pb: 2012, price: 8000, comment: ["손준호":["4.0","승일이형 나도 그랬어요"], "안세진":["3.0", "오 느낌!"], "김승건":["4.0", "좆됐다..."], "김한슬":["3.0", "나눌수록 괜찮네"], "이인준":["3.0", "두 번째 시집은 내시나요"]], image:UIImage(named: "book_18")!)
        
        let book_19 = Book(title: "레트로마니아", writer: "사이먼 레이놀즈", publisher: "작업실유령", date_ip: "20170402", date_pb: 2014, price: 18000, comment: ["손준호":["5","언급금지"]], image:UIImage(named: "book_19")!)
        
        let book_20 = Book(title: "예감은 틀리지 않는다", writer: "줄리언 반스", publisher: "다산책방", date_ip: "20170509", date_pb: 2012, price: 12800, comment: ["손준호":["3.5","모든 날이 일요일"], "안세진":["2.0", "철 좀 들자!"], "김승건":["2.5", "난독은 틀리지 않는다"], "이찬식":["5.0", "가독성이 좋다"], "이인준":["3.5", "우리의 티타임은 끝났다"]], image:UIImage(named: "book_20")!)
        
        let book_21 = Book(title: "라이프 오브 파이", writer: "이안", publisher: nil, date_ip: "20170603", date_pb: 2013, price: nil, comment: nil, image:UIImage(named: "book_21")!)
        
        let book_22 = Book(title: "잘자 푼푼", writer: "아사노 이니오", publisher: "애니북스", date_ip: "20170701", date_pb: 2008, price: 8000, comment: nil, image:UIImage(named: "book_22")!)
        
        let book_23 = Book(title: "바깥은 여름", writer: "김애란", publisher: "문학동네", date_ip: "20170719", date_pb: 2017, price: 13000, comment: ["손준호":["4.5","깔끔하다!"], "안세진":["4.5", "김애란"], "김한슬":["4.0", "다른 단편소설도 기대한다"], "김승건":["4.2", "바깥은 여름, 온도차 때문에 생긴 것은 눈물 아닌 구름"], "이인준":["5.0", "나는 어디로 가고 싶은가"]], image:UIImage(named: "book_23")!)
        
        let book_24 = Book(title: "여수", writer: "서효인", publisher: "문학과 지성사", date_ip: "20170818", date_pb: 2017, price: 8000, comment: nil, image:UIImage(named: "book_24")!)
        
        let book_25 = Book(title: "아무도 아닌", writer: "황정은", publisher: "문학동네", date_ip: "20170829", date_pb: 2016, price: 12000, comment: ["이찬식":["3.0","되게 재밌었어요"], "안세진":["3.5", "단순하게 살래요"], "김승건":["3.8", "당신은 존나 귀합니다"], "김한슬":["3.0", "장편 중편을 더 읽어보고 싶다"], "이인준":["4.0", "비정한 현실이 만든 비정한 진실"]], image:UIImage(named: "book_25")!)
        
        let book_26 = Book(title: "밤섬해적단 서울불바다", writer: "정윤석", publisher: nil, date_ip: "20170924", date_pb: 2017, price: 2500, comment: ["손준호":["3.9","역시 해적은 멋있어"], "안세진":["4.0", "모르겠다"], "김한슬":["2.8", "불편하게 잘 봤다"], "김승건":["4.0", "재밌는게 장땡 어버이!!!"], "이인준":["4.5", "사실 내가 영화 본게 별로 없어서 이게 제일 재밌었어"], "홍성근":["3.5", "이렇게 우린 모두 진보가 된다"]], image:UIImage(named: "book_26")!)
        
        let book_27 = Book(title: "양을 쫓는 모험", writer: "무라카미 하루키", publisher: "문학사상", date_ip: "20171112", date_pb: 1982, price: 12000, comment: ["손준호":["3.0","처음 뵙겠습니다"], "안세진":["2.0", "허허... 다음에 다시 봅시다"], "김한슬":["3.7", "질릴까봐 소설 2권 정도만 더 읽어보고 싶다"], "이인준":["3.5", "으흠.. 벌써 질렸다! 하지만 궁금하다"], "홍성근":["3.5", "인물만 남는다"]], image:UIImage(named: "book_27")!)
        
        let book_28 = Book(title: "외딴방", writer: "신경숙", publisher: "문학동네", date_ip: "20171204", date_pb: 1995, price: 15000, comment: ["손준호":["5.0","사람이 먼저다"], "안세진":["4.5", "그럼에도 삶이란..."], "이인준":["4.0", "왜 딴 방에 들어가신 건가요?"], "홍성근":["4.5", "색안경을 끼고 보니 다른게 보이더라"], "김승건":["4.3", "제 학점이 이랬으면..."]], image:UIImage(named: "book_28")!)
        
        
        // 2018년도
        
        let book_29 = Book(title: "전체관람가", writer: nil, publisher: "JTBC", date_ip: "20180113", date_pb: 2017, price: nil, comment: ["이찬식":["4.0","영화 이야기 너무 좋아"], "안세진":["3.5", "단편영화 랄랄라"], "이인준":["3.5", "단편영화? 몰까?"], "홍성근":["5.0", "한국 영화가 발전했음 좋겠다"], "김승건":["4.2", "취향따라 골라잡아"], "김한슬":["4.6", "단편영화 애용"]], image:UIImage(named: "book_29")!)
        
        let book_30 = Book(title: "라이언 킹 / 별의 목소리", writer: nil, publisher: nil, date_ip: "20180125", date_pb: 2000, price: 13000, comment: ["이찬식":["2.0","다음엔 좀 더 준비하도록 하겠습니다"], "안세진":["3.5", "빨리 일본가고 싶다"], "이인준":["3.1", "한줄평을 생각 안했네.."], "홍성근":["3.0", "애니메이션으로 한번 더 하자"], "김승건":["3.2", "너가 누군지를 잊지마!"], "김한슬":["2.3", "다음을 기대하겠습니다. 아, 좋았는데...(생략)"], "신유진":["3.3", "다음에는 공통된 주제가 있었으면 좋겠다"]], image:UIImage(named: "book_30")!)
        
        let book_31 = Book(title: "당신이 계속 불편하면 좋겠습니다", writer: "홍승은", publisher: "동녘", date_ip: "20180208", date_pb: 2017, price: 13500, comment: ["이찬식":["3.7","음... 아. 모르겠다"], "안세진":["3.0", "잘 못하는 것은 잘못하는 것입니까"], "박찬진":["2.6", "맥도날드 애플파이 다시 팔더라"], "홍성근":["3.0", "한 사람의 백 걸음보다 백 사람의 한 걸음"], "김승건":["3.6", "섬세한 침묵"], "김한슬":["4.2", "내가 나태하다는 걸 알게 해줘서 고맙습니다"], "박상정":["3.3", "일상의 편함 속에서 불편함을 잊지 말기"]], image:UIImage(named: "book_31")!)
        
        let book_32 = Book(title: "파티 51", writer: "정용택", publisher: nil, date_ip: "20180224", date_pb: 2014, price: 3500, comment: nil, image:UIImage(named: "book_32")!)
        
        let book_33 = Book(title: "온", writer: "안미옥", publisher: "창비", date_ip: "20180228", date_pb: 2017, price: 8000, comment: ["이찬식":["3.7","나를 보면 뭐가 보여?"], "안세진":["4.5", "자기만의 죄"], "박세진":["2.9", "아직 잘 모르겠다"], "김승건":["3.5", "안미온"], "이인준":["4.8", "머리에 이끼가 온"], "홍성근":["3.8", "오늘은 잘 모르겠다. 생각이 잘 안나네"]], image:UIImage(named: "book_33")!)
        
        
        var date_2015 = [Book]()
        date_2015.append(book_1)
        date_2015.append(book_2)
        date_2015.append(book_3)
        date_2015.append(book_4)
        date_2015.append(book_5)
        date_2015.append(book_6)
        date_2015.append(book_7)
        date_2015.append(book_8)
        date_2015.append(book_9)
        date_2015.append(book_10)
        date_2015.append(book_11)
        date_2015.append(book_12)
        date_2015.append(book_13)
        date_2015.append(book_14)
        date_2015.append(book_15)
        date_2015.append(book_16)
        
        var date_2016 = [Book]()
        var date_2017 = [Book]()
        date_2017.append(book_17)
        date_2017.append(book_18)
        date_2017.append(book_19)
        date_2017.append(book_20)
        date_2017.append(book_21)
        date_2017.append(book_22)
        date_2017.append(book_23)
        date_2017.append(book_24)
        date_2017.append(book_25)
        date_2017.append(book_26)
        date_2017.append(book_27)
        date_2017.append(book_28)
        
        var date_2018 = [Book]()
        date_2018.append(book_29)
        date_2018.append(book_30)
        date_2018.append(book_31)
        date_2018.append(book_32)
        date_2018.append(book_33)
        
        bookData.append(date_2015)
        bookData.append(date_2016)
        bookData.append(date_2017)
        bookData.append(date_2018)
    }
}

// 책 정보 저장 class
class Book{
    
    let title:String //책 제목
    let writer:String? //저자 (optional)
    let publisher:String? //출판사 (optional)
    let date_ip:String //입씨름을 한 날짜
    let date_pb:Int? //출판년도 (optional)
    let price:Int? //가격 (optional)
    let comment:[String:[String]]?//멤버별 코멘트 및 별점 (멤버를 key로 받아 코멘트와 별점을 value로 받는다. String을 key로 갖고 String 배열을 value로 받음) (optional)
    let image:UIImage //사진
    
    init(title:String, writer:String?, publisher:String?, date_ip:String, date_pb:Int?, price:Int?, comment:[String:[String]]?, image:UIImage){
        
        self.title = title
        self.writer = writer
        self.publisher = publisher
        self.date_ip = date_ip
        self.date_pb = date_pb
        self.price = price
        self.comment = comment
        self.image = image
    }
}

let bookDataCenter:BookDataCenter = BookDataCenter() // 정보는 여기에






