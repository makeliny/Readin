//
//  TableViewController.swift
//  TushuDemo
//
//  Created by akke on 2018/12/30.
//  Copyright © 2018 akke. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController,UITextFieldDelegate {
    var bookJSON : JSON!
    var serachtext : UITextField!
    var tb = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if bookJSON == nil {
            bookJSON = JSON()
        }
        serachtext = UITextField(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        serachtext.placeholder = "请输入搜索内容"
        
        serachtext.delegate = self
        navigationItem.titleView = serachtext
        var isbn = "江南"
        //booksearch(isbn: isbn)
        
        //print(bookJSON["books"][2]["title"])

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        booksearch(isbn: serachtext.text!)
        textField.resignFirstResponder()
        return true
    }
    func booksearch(isbn:String){
        //输入isbn,想豆瓣服务器查询，先确isbn是否正确，如果错误就弹出提示框，正确就把返回的JSON存储到字典里。
        //等下次用户再查询isbn，把原来存储的书籍标题拿出来，检查返回的标题是否在已经存储的字典里，如果在就弹提示框取消存储，如果不在就添加。
        let url = "https://api.douban.com/v2/book/search?q=\(isbn)"
        let ur = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        Alamofire.request(ur!).responseJSON { (response) in
            
            if response.result.isSuccess {
                print("成功获取到数据")
                let book1 : JSON = JSON(response.result.value!)
                if book1["msg"] == "book_not_found"{
                    self.chrysan.show(.error, message: "找不到此ISBN编号的书籍，请核对后再试", hideDelay: 2)
                } else {
                    self.bookJSON = book1
                    self.tableView.reloadData()
                    print(self.bookJSON["books"][10]["title"].stringValue)
                    self.tb = self.bookJSON["books"].count
                    self.tableView.reloadData()
                    //print("\(book1["author"].rawValue)")
                    
                }
                //                self.booklist(book: book1)
                //                print(self.bookinfo.title)
            } else {
                print("cuowu")
            }
            
            
        }
    }
 
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 20
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Sell") as! Sell
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "Sell") as! Sell
        }

        cell.bktitle.text = "r"
        //cell.textLabel?.text = bookJSON["books"][indexPath.row]["title"].stringValue
        return cell
        
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    

}

