//
//  SearchResult.swift
//  StoreSearch
//
//  Created by Yujung Lee on 2016. 6. 23..
//  Copyright © 2016년 YujungLee. All rights reserved.
//

//search Result Data class

import Foundation

class SearchResult {
    class Entry {
        var title = ""
        var date = ""
        var place = ""
        var price:Int = 0
        var progress:Double = 0
        var url = ""
        
        init(title: String, date: String, place: String, price: Int, progress: Double, url: String){
            self.title = title
            self.date = date
            self.place = place
            self.price = price
            self.progress = progress
            self.url = url
        }
    }
    
    
    let events = [
        Entry(title: "아라리오뮤지엄 인 스페이스: Really?", date: "2014.08.01 ~ 2017.07.31", place: "ARARIO MUSEUM IN SPACE", price: 12000, progress: 0.3,
            url:"http://korean.visitseoul.net/tickets-offers/%EC%95%84%EB%9D%BC%EB%A6%AC%EC%98%A4%EB%AE%A4%EC%A7%80%EC%97%84%EC%9D%B8%EC%8A%A4%ED%8E%98%EC%9D%B4%EC%8A%A4:Really2_/16004?curPage=1"),
        Entry(title: "K-pop 홀로그램 콘서트 “케이라이브(K-liv)”", date: "2016.03.01 ~ 2016.12.31", place: "케이라이브(K-live)", price: 33000,  progress: 0.9,
            url: "http://korean.visitseoul.net/tickets-offers/K-pop%ED%99%80%EB%A1%9C%EA%B7%B8%EB%9E%A8%EC%BD%98%EC%84%9C%ED%8A%B8%E2%80%9C%EC%BC%80%EC%9D%B4%EB%9D%BC%EC%9D%B4%EB%B8%8C(K-live)%E2%80%9D2_/16029?curPage=1")
    ]
}





/*
 class Data {
 class Entry {
 let filename : String
 let heading : String
 let date : String
 let time : String
 let left : Int
 init(fname : String, heading : String, date: String, time:String, left:Int) {
 self.heading = heading
 self.filename = fname
 self.date = date
 self.time = time
 self.left = left
 }
 }
 
 let places = [
 Entry(fname: "image0", heading: "이벤트 이름", date: "이벤트 날짜", time: "시간 시간 시간", left:10),
 Entry(fname: "image1", heading: "Heading 2", date: "2016. 6. 23.", time: "14:00", left:10),
 Entry(fname: "image2", heading: "Heading 3", date: "2016. 6. 23.", time: "14:00", left:10),
 Entry(fname: "image3", heading: "Heading 4", date: "2016. 6. 23.", time: "14:00", left:10),
 Entry(fname: "image4", heading: "Heading 5", date: "2016. 6. 23.", time: "14:00", left:10)
 ]
 
 }
 */