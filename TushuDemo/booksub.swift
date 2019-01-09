//
//  booksub.swift
//  TushuDemo
//
//  Created by akke on 2018/12/31.
//  Copyright © 2018 akke. All rights reserved.
//

import UIKit
import SwiftyJSON
class booksub: UIViewController {
var bkimage = ""
    var blkjson = JSON()
    var bkint = 0
    var bookinfo = BookInfo()
    @IBOutlet weak var bookimage: UIImageView!
 
    @IBAction func add(_ sender: Any) {
        booklist(book: blkjson)
        dismiss(animated: true, completion: nil)
        print("cg")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookdic()

        print(bkimage)
        let imaurl = URL(string: bkimage)
        bookimage.kf.setImage(with: imaurl)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func b(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
        if bookinfo.title?.contains(book["books"][bkint]["title"].string!) == false {
            var author = ""
            bookinfo.alt?.append(book["books"][bkint]["alt"].string!)
            bookinfo.alt_title?.append(book["books"][bkint]["alt_title"].stringValue)
            var ts = book["books"][bkint]["author"].arrayObject as! Array<String>
            var s1 = ""
            for i in ts {
                s1 = s1 + "/" + i
            }
            s1 = String(s1.dropFirst())
            bookinfo.author?.append(s1)
            s1.removeAll()
            bookinfo.author_intro?.append(book["books"][bkint]["author_intro"].string!)
            bookinfo.binding?.append(book["books"][bkint]["binding"].string!)
            bookinfo.catalog?.append(book["books"][bkint]["catalog"].string!)
            bookinfo.id?.append(book["books"][bkint]["id"].string!)
            bookinfo.image?.append(book["books"][bkint]["image"].string!)
            bookinfo.imagesSmall?.append(book["books"][bkint]["images","small"].string!)
            bookinfo.imagesMedium?.append(book["books"][bkint]["images","medium"].string!)
            bookinfo.imagesLarge?.append(book["books"][bkint]["images","large"].string!)
            bookinfo.isbn10?.append(book["books"][bkint]["isbn10"].string!)
            bookinfo.isbn13?.append(book["books"][bkint]["isbn13"].string!)
            bookinfo.origin_title?.append(book["books"][bkint]["origin_title"].string!)
            bookinfo.page?.append(book["books"][bkint]["pages"].string!)
            bookinfo.price?.append(book["books"][bkint]["price"].string!)
            bookinfo.pubdate?.append(book["books"][bkint]["pubdate"].string!)
            bookinfo.publisher?.append(book["books"][bkint]["publisher"].string!)
            bookinfo.ratingAverage?.append(book["books"][bkint]["rating","average"].string!)
            bookinfo.ratingNumRaters?.append("\(book["books"][bkint]["rating","numRaters"].int!)")
            bookinfo.subtitle?.append(book["books"][bkint]["subtitle"].string!)
            bookinfo.summary?.append(book["books"][bkint]["summary"].string!)
            bookinfo.title?.append(book["books"][bkint]["title"].string!)
            bookinfo.url?.append(book["books"][bkint]["url"].string!)
            
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
