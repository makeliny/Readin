//
//  File.swift
//  TushuDemo
//
//  Created by akke on 2018/12/25.
//  Copyright © 2018 akke. All rights reserved.
//

import Foundation
class BookInfo {
    var title : Array<String>? //标题
    var summary : Array<String>?  //简介
    var image : Array<String>?  //预览封面
    var page : Array<String>?  //页数
    var publisher : Array<String>? //出版社
    var imagesMedium : Array<String>?
    var imagesSmall : Array<String>?
    var imagesLarge : Array<String>?
    var id : Array<String>?  //编号
    //var rating/*[numRaters/*评分人数*/][average/*评分*/] */= "" //豆瓣评分
    var ratingNumRaters : Array<String>?
    var ratingAverage : Array<String>?
    var author : Array<String>?  //作者
    var url : Array<String>?  //本书api链接
    var author_intro : Array<String>?  //作者信息
    var binding : Array<String>? //装订方式
    var pubdate : Array<String>?  //更新日期
    var catalog : Array<String>?  //目录
    var alt_title : Array<String>? //原名
    var isbn10 : Array<String>?  //isbn10编号
    var isbn13 : Array<String>?
    var alt : Array<String>?  //本书豆瓣链接
    var origin_title : Array<String>?  //原名
    var price : Array<String>?  //价格
    var subtitle : Array<String>? //副标题
}
