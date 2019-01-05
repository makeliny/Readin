//
//  Searchview.swift
//  TushuDemo
//
//  Created by akke on 2019/1/2.
//  Copyright © 2019 akke. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import ViewAnimator
class Searchview: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    @IBOutlet weak var tabelview: UITableView!
    var bookJSON : JSON!

    @IBOutlet weak var searchbar: UITextField!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    private let animations = [AnimationType.from(direction: .bottom, offset: 30.0)]
    
    @IBAction func r(_ sender: UIButton) {
        tabelview.reloadData()
        UIView.animate(views: tabelview.visibleCells, animations: animations, completion: {
            print("wanc")
        })
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchcell") as! searchcell
        if bookJSON.isEmpty == false {
        cell.bktitle.text = bookJSON["books"][indexPath.row]["title"].stringValue
        cell.bkauthor.text = (bookJSON["books"][indexPath.row]["author"].arrayObject as! Array<String>).joined(separator:"")
        let imageurl = URL(string:bookJSON["books"][indexPath.row]["images"]["small"].stringValue)
        cell.fm.kf.setImage(with: imageurl)
        
            return cell}
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchbar
        if bookJSON == nil{
            bookJSON = JSON()
        }
//booksearch(isbn: "swift")
        // Do any additional setup after loading the view.
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
                    self.tabelview.reloadData()
                    print(self.bookJSON["books"][10]["title"].stringValue)
                    
                    //print("\(book1["author"].rawValue)")
                    
                }
                //                self.booklist(book: book1)
                //                print(self.bookinfo.title)
            } else {
                print("cuowu")
            }
            
            
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchbar.resignFirstResponder()
        booksearch(isbn: searchbar.text!)
        tabelview.reloadData()
        UIView.animate(views: tabelview.visibleCells, animations: animations, completion: {
            print("wanc")
        })
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let row = tabelview.indexPathForSelectedRow?.row
        let bs = segue.destination as! booksub
        bs.bkimage = bookJSON["books"][row!]["image"].stringValue
        bs.blkjson = bookJSON
        bs.bkint = row!
        print(bs.bkimage)
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
