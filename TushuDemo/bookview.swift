//
//  bookview.swift
//  TushuDemo
//
//  Created by akke on 2018/12/27.
//  Copyright © 2018 akke. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftyJSON

class bookview: UIViewController,UITextFieldDelegate {
    let bookinfo = BookInfo()
    var index = Int()
    @IBOutlet weak var im: UIImageView!

    @IBOutlet weak var bksumaiy: UITextView!
    @IBOutlet weak var bkimagel: UIImageView!
    @IBOutlet weak var bkname: UILabel!
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
    navigationItem.largeTitleDisplayMode = .never
        bookdic()
        

        im.kf.setImage(with: URL(string: bookinfo.imagesLarge![index]))
        bkname.text = bookinfo.title![index]
        bkimagel.kf.setImage(with: URL(string: bookinfo.imagesMedium![index]))
        bksumaiy.text = bookinfo.summary![index]

        // Do any additional setup after loading the view.
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
        bookinfo.page = UserDefaults.standard.value(forKey: "bookinfo.image") as! Array<String>?
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
        bookinfo.id = UserDefaults.standard.value(forKey: "bookinfo.author") as! Array<String>?
        if bookinfo.id == nil {
            bookinfo.id = Array<String>()
        }
        bookinfo.url = UserDefaults.standard.value(forKey: "bookinfo.url") as! Array<String>?
        if bookinfo.url == nil {
            bookinfo.url = Array<String>()
        }
        bookinfo.author_intro = UserDefaults.standard.value(forKey: "bookinfo.author_intro") as! Array<String>?
        if bookinfo.author_intro == nil {
            bookinfo.author_intro = Array<String>()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
