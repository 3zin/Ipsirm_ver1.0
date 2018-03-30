//
//  History.swift
//  SejinNaverMap
//
//  Created by 3zin on 2018. 2. 26..
//  Copyright © 2018년 3zin. All rights reserved.
//
//  History section

import UIKit

class History: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addSlideMenuButton()
        self.title = "History"
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return bookDataCenter.bookData.count
    }
    
    // number of rows per section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookDataCenter.bookData[section].count
    }
    
    // each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // bookData 2차원 배열에서 주어진 행에 맞는 데이터를 꺼낸다
        let row = bookDataCenter.bookData[indexPath.section][indexPath.row]
        let cell:HistoryCell? = (tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell)
        
        // 셀 이름 설정
        cell?.textCell?.text = row.date_ip + " " + row.title
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        if(indexPath == selected_index){
            cell?.textCell?.textColor = UIColor(red:1.00, green:0.00, blue:0.81, alpha:1.0)
        }else{
            cell?.textCell?.textColor = UIColor.black
        }
        
        if let cell = cell{
            return cell
        }else{
            // default set
            return HistoryCell()
        }
    }
    
    
    // 섹션 앞에 들어갈 header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // 흰 배경
        let cell = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        cell.backgroundColor = UIColor.white
        
        // 검은 줄
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: self.view.frame.width-15, height: 30))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "_________________________  " + String(2015+section)
        cell.addSubview(label)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // 섹션 뒤에 들어갈 footer (공백)
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        cell.backgroundColor = UIColor.white
        return cell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    // segue control
    // preparesegue와 performsegue를 이용함. 공용 데이터 전달은 didselect내부 perform에서 담당.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination:HistoryView = segue.destination as? HistoryView else{return}
        destination.param = sender as? Book
    }
    
    
    // 임의의 시점에 performSegue 사용. sender을 통해 indexPath에 맞는 data 전달
    // 클릭시 색깔 변경
    // 각각의 cell에 설정된 색깔은 cell이 화면에서 사라지는 순간 셀과 함께 사라지게 됨. 따라서 선택된 cell의 indexpath를 기억해두었다가, 셀을 새롭게 초기화하는 과정에서 비교하여 기존에 선택하고 있었던 셀이면 색깔을 분홍색으로 만들어주는 작업이 cellforrow... method 내에서 필요함
    var selected_index:IndexPath = IndexPath(row: -1, section: -1)
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? HistoryCell{
            //cell?.contentView.backgroundColor = UIColor(red:1.00, green:0.00, blue:0.81, alpha:1.0)
            cell.textCell?.textColor = UIColor(red:1.00, green:0.00, blue:0.81, alpha:1.0)
            selected_index = indexPath
        
            //segue에 맞춰서 prepare가 이루어진 후 자동으로 이동하게 됨.
            performSegue(withIdentifier: "view_sg", sender: bookDataCenter.bookData[indexPath.section][indexPath.row])
        }
    }
    
    // 클릭 취소시 색깔 변경
    // 스크롤 등으로 인해 화면 밖으로 셀이 나갔을 경우 셀 자체가 이미 사라졌을 것이기 때문에, diddeselectrowat 메소드가 nil을 참조하게 됨. 이 때는 optional binding을 통해 무시하도록 한다. (cellforrow... method에서 처리할 것이기 때문)
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? HistoryCell{
            //cell?.contentView.backgroundColor = UIColor.clear
            cell.textCell?.textColor = UIColor.black
            selected_index = IndexPath(row: -1, section: -1)
        }
    }
    
}
