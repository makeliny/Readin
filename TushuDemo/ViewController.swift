//
//  ViewController.swift
//  TushuDemo
//
//  Created by akke on 2018/12/25.
//  Copyright © 2018 akke. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Chrysan
import Kingfisher
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    
    @IBOutlet weak var searchbar: UITextField!
    var s1 = ""
    @IBOutlet weak var tableView: UITableView!
    var bookinfo = BookInfo()
    var booke = ""
    override func viewDidLoad() {
        
        bookdic()
        let isbn = "9787301298862"
        booksearch(isbn: isbn)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func booksearch(isbn:String){
        //输入isbn,想豆瓣服务器查询，先确isbn是否正确，如果错误就弹出提示框，正确就把返回的JSON存储到字典里。
        //等下次用户再查询isbn，把原来存储的书籍标题拿出来，检查返回的标题是否在已经存储的字典里，如果在就弹提示框取消存储，如果不在就添加。
        Alamofire.request("https://api.douban.com/v2/book/isbn/\(isbn)").responseJSON { (response) in
            
            if response.result.isSuccess {
                print("成功获取到数据")
                let book1 : JSON = JSON(response.result.value!)
                if book1["msg"] == "book_not_found"{
                    self.chrysan.show(.error, message: "找不到此ISBN编号的书籍，请核对后再试", hideDelay: 2)
                } else {
                    self.booklist(book: book1)
                    self.tableView.reloadData()
                    
                    print(self.s1)
                    //print("\(book1["author"].rawValue)")

                }
                //                self.booklist(book: book1)
                //                print(self.bookinfo.title)
            } else {
                print("cuowu")
            }
            
            
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 获取输入的文本，移除向输入框中粘贴文本时，系统自动加上的空格（iOS11上有该问题）
        let new = string.replacingOccurrences(of: " ", with: "")
        // 获取编辑前的文本
        var old = NSString(string: textField.text ?? "")
        // 获取编辑后的文本
        old = old.replacingCharacters(in: range, with: new) as NSString
        // 获取数字的字符集
        let number = CharacterSet(charactersIn: "0123456789")
        // 判断编辑后的文本是否全为数字
        if old.rangeOfCharacter(from: number.inverted).location == NSNotFound {
            // number.inverted表示除了number中包含的字符以外的其他全部字符
            // 如果old中不包含其他字符，则格式正确
            // 允许本次编辑
            textField.text = old as String
            // 移动光标的位置
            DispatchQueue.main.async {
                let beginning = textField.beginningOfDocument
                let position = textField.position(from: beginning, offset: range.location + new.count)!
                textField.selectedTextRange = textField.textRange(from: position, to: position)
            }
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchbar.resignFirstResponder()
        
        booksearch(isbn: searchbar.text!)
        return true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  (bookinfo.title?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        let imageurl = URL(string:bookinfo.image![indexPath.row])
        cell.bookimage.kf.setImage(with: imageurl)
        cell.bookname.text = bookinfo.title![indexPath.row]
        //print(imageurl)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath[1])
    }
    
    
    
    
    func bookdic(){
        bookinfo.title = UserDefaults.standard.value(forKey: "bookinfo.title") as! Array<String>?
        if bookinfo.title==nil {
            bookinfo.title = Array<String>()
        }
        bookinfo.summary = UserDefaults.standard.value(forKey: "bookinfo.summary") as! Array<String>?
        if bookinfo.summary == nil {
            bookinfo.summary = Array<String>()
        }
        bookinfo.image = UserDefaults.standard.value(forKey: "bookinfo.image") as! Array<String>?
        if bookinfo.image == nil {
            bookinfo.image = Array<String>()
        }
        bookinfo.page = UserDefaults.standard.value(forKey: "bookinfo.page") as! Array<String>?
        if bookinfo.page == nil {
            bookinfo.page = Array<String>()
        }
        bookinfo.isbn10 = UserDefaults.standard.value(forKey: "bookinfo.isbn10") as! Array<String>?
        if bookinfo.isbn10 == nil {
            bookinfo.isbn10 = Array<String>()
        }
        bookinfo.isbn13 = UserDefaults.standard.value(forKey: "bookinfo.isbn13") as! Array<String>?
        if bookinfo.isbn13 == nil {
            bookinfo.isbn13 = Array<String>()
        }
        bookinfo.publisher = UserDefaults.standard.value(forKey: "bookinfo.publisher") as! Array<String>?
        if bookinfo.publisher == nil {
            bookinfo.publisher = Array<String>()
        }
        bookinfo.imagesMedium = UserDefaults.standard.value(forKey: "bookinfo.imagesMedium") as! Array<String>?
        if bookinfo.imagesMedium == nil {
            bookinfo.imagesMedium = Array<String>()
        }
        bookinfo.imagesSmall = UserDefaults.standard.value(forKey: "bookinfo.imagesSmall") as! Array<String>?
        if bookinfo.imagesSmall == nil {
            bookinfo.imagesSmall = Array<String>()
        }
        bookinfo.imagesLarge = UserDefaults.standard.value(forKey: "bookinfo.imagesLarge") as! Array<String>?
        if bookinfo.imagesLarge == nil {
            bookinfo.imagesLarge = Array<String>()
        }
        bookinfo.ratingNumRaters = UserDefaults.standard.value(forKey: "bookinfo.ratingNumRaters") as! Array<String>?
        if bookinfo.ratingNumRaters == nil {
            bookinfo.ratingNumRaters = Array<String>()
        }
        bookinfo.ratingAverage = UserDefaults.standard.value(forKey: "bookinfo.ratingAverage") as! Array<String>?
        if bookinfo.ratingAverage == nil {
            bookinfo.ratingAverage = Array<String>()
        }
        bookinfo.author = UserDefaults.standard.value(forKey: "bookinfo.author") as! Array<String>?
        if bookinfo.author == nil {
            bookinfo.author = Array<String>()
        }
        bookinfo.url = UserDefaults.standard.value(forKey: "bookinfo.url") as! Array<String>?
        if bookinfo.url == nil {
            bookinfo.url = Array<String>()
        }
        bookinfo.author_intro = UserDefaults.standard.value(forKey: "bookinfo.author_intro") as! Array<String>?
        if bookinfo.author_intro == nil {
            bookinfo.author_intro = Array<String>()
        }
        bookinfo.id = UserDefaults.standard.value(forKey: "bookinfo.id") as! Array<String>?
        if bookinfo.id == nil {
            bookinfo.id = Array<String>()
        }
        bookinfo.binding = UserDefaults.standard.value(forKey: "bookinfo.binding") as! Array<String>?
        if bookinfo.binding == nil {
            bookinfo.binding = Array<String>()
        }
        bookinfo.pubdate = UserDefaults.standard.value(forKey: "bookinfo.pubdate") as! Array<String>?
        if bookinfo.pubdate == nil {
            bookinfo.pubdate = Array<String>()
        }
        bookinfo.catalog = UserDefaults.standard.value(forKey: "bookinfo.catalog") as! Array<String>?
        if bookinfo.catalog == nil {
            bookinfo.catalog = Array<String>()
        }
        bookinfo.alt_title = UserDefaults.standard.value(forKey: "bookinfo.alt_title") as! Array<String>?
        if bookinfo.alt_title == nil {
            bookinfo.alt_title = Array<String>()
        }
        bookinfo.alt = UserDefaults.standard.value(forKey: "bookinfo.alt") as! Array<String>?
        if bookinfo.alt == nil {
            bookinfo.alt = Array<String>()
        }
        bookinfo.origin_title = UserDefaults.standard.value(forKey: "bookinfo.origin_title") as! Array<String>?
        if bookinfo.origin_title == nil {
            bookinfo.origin_title = Array<String>()
        }
        bookinfo.price = UserDefaults.standard.value(forKey: "bookinfo.price") as! Array<String>?
        if bookinfo.price == nil {
            bookinfo.price = Array<String>()
        }
        bookinfo.subtitle = UserDefaults.standard.value(forKey: "bookinfo.subtitle") as! Array<String>?
        if bookinfo.subtitle == nil {
            bookinfo.subtitle = Array<String>()
        }
    }
    func booklist(book : JSON){
        bookdic()
        if bookinfo.title?.contains(book["title"].string!) == false {
            var author = ""
            bookinfo.alt?.append(book["alt"].string!)
            bookinfo.alt_title?.append(book["alt_title"].stringValue)
            var ts = book["author"].arrayObject as! Array<String>
            for i in ts {
                self.s1 = self.s1 + "/" + i
            }
            s1 = String(s1.dropFirst())
            bookinfo.author?.append(s1)
            s1.removeAll()
            bookinfo.author_intro?.append(book["author_intro"].string!)
            bookinfo.binding?.append(book["binding"].string!)
            bookinfo.catalog?.append(book["catalog"].string!)
            bookinfo.id?.append(book["id"].string!)
            bookinfo.image?.append(book["image"].string!)
            bookinfo.imagesSmall?.append(book["images","small"].string!)
            bookinfo.imagesMedium?.append(book["images","medium"].string!)
            bookinfo.imagesLarge?.append(book["images","large"].string!)
            bookinfo.isbn10?.append(book["isbn10"].string!)
            bookinfo.isbn13?.append(book["isbn13"].string!)
            bookinfo.origin_title?.append(book["origin_title"].string!)
            bookinfo.page?.append(book["pages"].string!)
            bookinfo.price?.append(book["price"].string!)
            bookinfo.pubdate?.append(book["pubdate"].string!)
            bookinfo.publisher?.append(book["publisher"].string!)
            bookinfo.ratingAverage?.append(book["rating","average"].string!)
            bookinfo.ratingNumRaters?.append("\(book["rating","numRaters"].int!)")
            bookinfo.subtitle?.append(book["subtitle"].string!)
            bookinfo.summary?.append(book["summary"].string!)
            bookinfo.title?.append(book["title"].string!)
            bookinfo.url?.append(book["url"].string!)
            
            UserDefaults.standard.set(bookinfo.alt, forKey: "bookinfo.alt")
            UserDefaults.standard.set(bookinfo.author_intro, forKey: "bookinfo.author_intro")
            UserDefaults.standard.set(bookinfo.author, forKey: "bookinfo.author")
            UserDefaults.standard.set(bookinfo.alt_title, forKey: "bookinfo.alt_title")
            UserDefaults.standard.set(bookinfo.binding, forKey: "bookinfo.binding")
            UserDefaults.standard.set(bookinfo.catalog, forKey: "bookinfo.catalog")
            UserDefaults.standard.set(bookinfo.id, forKey: "bookinfo.id")
            UserDefaults.standard.set(bookinfo.image, forKey: "bookinfo.image")
            UserDefaults.standard.set(bookinfo.imagesLarge, forKey: "bookinfo.imagesLarge")
            UserDefaults.standard.set(bookinfo.imagesMedium, forKey: "bookinfo.imagesMedium")
            UserDefaults.standard.set(bookinfo.imagesSmall, forKey: "bookinfo.imagesSmall")
            UserDefaults.standard.set(bookinfo.isbn10, forKey: "bookinfo.isbn10")
            UserDefaults.standard.set(bookinfo.isbn13, forKey: "bookinfo.isbn13")
            UserDefaults.standard.set(bookinfo.origin_title, forKey: "bookinfo.origin_title")
            UserDefaults.standard.set(bookinfo.page, forKey: "bookinfo.page")
            UserDefaults.standard.set(bookinfo.price, forKey: "bookinfo.price")
            UserDefaults.standard.set(bookinfo.pubdate, forKey: "bookinfo.pubdate")
            UserDefaults.standard.set(bookinfo.publisher, forKey: "bookinfo.publisher")
            UserDefaults.standard.set(bookinfo.ratingAverage, forKey: "bookinfo.ratingAverage")
            UserDefaults.standard.set(bookinfo.ratingNumRaters, forKey: "bookinfo.ratingNumRaters")
            UserDefaults.standard.set(bookinfo.summary, forKey: "bookinfo.summary")
            UserDefaults.standard.set(bookinfo.subtitle, forKey: "bookinfo.subtitle")
            UserDefaults.standard.set(bookinfo.title, forKey: "bookinfo.title")
            UserDefaults.standard.set(bookinfo.url, forKey: "bookinfo.url")
            UserDefaults.standard.synchronize()
        } else {
            let alte = UIAlertController(title: "温馨提醒", message: "本书已经存在，请勿重复添加", preferredStyle: .alert)
            let action = UIAlertAction(title: "确认", style: .cancel, handler: nil)
            alte.addAction(action)
            self.present(alte,animated: true,completion: nil)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let row = tableView.indexPathForSelectedRow?.row
        let bv = segue.destination as! bookview
        bv.index = row!

    }
    

    
}


