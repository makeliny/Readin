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

class ViewController: UIViewController {
    var bookinfo = BookInfo()
    var booke = ""
    override func viewDidLoad() {
        bookdic()
        let isbn = "https://api.douban.com/v2/book/isbn/978754115173"
        booksearch(isbn: isbn)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func booksearch(isbn:String){
        //输入isbn,想豆瓣服务器查询，先确isbn是否正确，如果错误就弹出提示框，正确就把返回的JSON存储到字典里。
        //等下次用户再查询isbn，把原来存储的书籍标题拿出来，检查返回的标题是否在已经存储的字典里，如果在就弹提示框取消存储，如果不在就添加。
        Alamofire.request("https://api.douban.com/v2/book/isbn/978754115173\(isbn)").responseJSON { (response) in
            
            if response.result.isSuccess {
                print("成功获取到数据")
                let book1 : JSON = JSON(response.result.value!)
                if book1["msg"] == "book_not_found"{
                    let alrt = UIAlertController(title: "错误❌", message: "找不到此ISBN编号的书籍，请核对后再试", preferredStyle:.alert)
                    let action = UIAlertAction(title: "确定", style: .cancel, handler: nil)
                    alrt.addAction(action)
                    self.present(alrt,animated: true,completion: nil)
                } else {
                    self.booklist(book: book1)
                    print(self.bookinfo.title!)
                }
                //                self.booklist(book: book1)
                //                print(self.bookinfo.title)
            } else {
                print("cuowu")
            }
            
            
        }
    }
    
    
    
    
    
    
    func bookdic(){
        bookinfo.title = UserDefaults.standard.value(forKey: "bookinfo.title") as! Array<String>?
        if bookinfo.title==nil {
            bookinfo.title = Array<String>()
        }
        bookinfo.summary = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.image = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.page = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.isbn10 = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.isbn13 = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.publisher = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.imagesMedium = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.imagesSmall = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.imagesLarge = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.ratingNumRaters = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.ratingAverage = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.author = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.url = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.author_intro = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.binding = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.pubdate = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.catalog = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.alt_title = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.alt = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.origin_title = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.price = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
        bookinfo.subtitle = UserDefaults.standard.value(forKey: "bookinfo.") as! Array<String>?
    }
    func booklist(book : JSON){
        bookdic()
        if bookinfo.title?.contains(book["title"].string!) == false {
            bookinfo.alt?.append(book["alt"].string!)
            bookinfo.alt_title?.append(book["alt_title"].string!)
            bookinfo.author?.append(book["author"].string!)
            bookinfo.author_intro?.append(book["author_intro"].string!)
            bookinfo.binding?.append(book["binding"].string!)
            bookinfo.catalog?.append(book["catalog"].string!)
            bookinfo.id?.append(book["id"].string!)
            bookinfo.image?.append(book["image"].string!)
            bookinfo.imagesSmall?.append(book["imagesSmall"].string!)
            bookinfo.imagesMedium?.append(book["imagesMedium"].string!)
            bookinfo.imagesLarge?.append(book["imagesLarge"].string!)
            bookinfo.isbn10?.append(book["isbn10"].string!)
            bookinfo.isbn13?.append(book["isbn13"].string!)
            bookinfo.origin_title?.append(book["origin_title"].string!)
            bookinfo.page?.append(book["page"].string!)
            bookinfo.price?.append(book["price"].string!)
            bookinfo.pubdate?.append(book["pubdate"].string!)
            bookinfo.publisher?.append(book["publisher"].string!)
            bookinfo.ratingAverage?.append(book["ratingAverage"].string!)
            bookinfo.ratingNumRaters?.append(book["ratingNumRaters"].string!)
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
//    func bookinfo(book : JSON){
//         bookDic = UserDefaults.standard.value(forKey:"BookList") as! Dictionary<String,Array<String>>
//
//        if bookDic.keys.first == book["title"].string! {
//            //把新加的book和原来存储的做比较
//        }
//        bookinfo.title = book["title"].string!
//        bookinfo.summary = book["summary"].string!
//        bookinfo.image = book["image"].string!
//        bookinfo.page = book["page"].string!
//        bookinfo.isbn10 = book["isbn10"].string!
//        bookinfo.isbn13 = book["isbn13"].string!
//        bookinfo.publisher = book["publisher"].string!
//        bookinfo.imagesMedium = book["images"]["medium"].string!
//        bookinfo.imagesSmall = book["images"]["small"].string!
//        bookinfo.imagesLarge = book["images"]["large"].string!
//        bookinfo.ratingNumRaters = book["rating"]["numRaters"].string!
//        bookinfo.ratingAverage = book["rating"]["average"].string!
//        bookinfo.author = book["author"].string!
//        bookinfo.url = book["url"].string!
//        bookinfo.author_intro = book["author_intro"].string!
//        bookinfo.binding = book["binding"].string!
//        bookinfo.pubdate = book["pubdate"].string!
//        bookinfo.catalog = book["catalog"].string!
//        bookinfo.alt_title = book["alt_title"].string!
//        bookinfo.alt = book["alt"].string!
//        bookinfo.origin_title = book["origin_title"].string!
//        bookinfo.price = book["price"].string!
//        bookinfo.subtitle = book["subtitle"].string!
//        bookArray = [bookinfo.title,bookinfo.summary,bookinfo.image,bookinfo.page,bookinfo.isbn10,bookinfo.isbn13,bookinfo.publisher,bookinfo.imagesMedium,bookinfo.imagesSmall,bookinfo.imagesLarge,bookinfo.ratingNumRaters,bookinfo.ratingAverage,bookinfo.author,bookinfo.url,bookinfo.author_intro,bookinfo.binding,bookinfo.pubdate,bookinfo.catalog,bookinfo.alt_title,bookinfo.alt,bookinfo.origin_title,bookinfo.price,bookinfo.subtitle]
//        bookDic.updateValue(bookArray, forKey: bookinfo.title)
//        UserDefaults.standard.set(bookDic, forKey: "BookList")
//       //如果要使用数据，先实例化
//    }

    
}


