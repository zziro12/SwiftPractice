//
//  ViewController.swift
//  SimpleTable
//
//  Created by Jinho Choi on 2020/09/14.
//  Copyright © 2020 Jinho Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "customCell"
    
    let korean: [String] = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하"]
    let english: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    var dates: [Date] = []
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func touchUpAddButton(_ sender: UIButton){
        dates.append(Date())
//        self.tableView.reloadData()
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //코드로 하는법
//        self.tableView.delegate = self
//        self.tableView.dataSource =self
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let nextViewController: secondViewController = segue.destination as? secondViewController else {
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        
        nextViewController.textToSet = cell.textLabel?.text
        
    }
    
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.section < 2{
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text

            return cell
        } else {
            guard let customCell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as? CustomTableViewCell else {
                return UITableViewCell()
            }
            
            customCell.leftLabel.text = self.dateFormatter.string(from: dates[indexPath.row])
            customCell.rightLabel.text = self.timeFormatter.string(from: dates[indexPath.row])
            
            return customCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2{
            return section == 0 ? "한글" : "영어"
        }
        return nil
    }
    
    
    
    
}

