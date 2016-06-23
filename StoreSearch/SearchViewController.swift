//
//  ViewController.swift
//  StoreSearch
//
//  Created by Yujung Lee on 2016. 6. 23..
//  Copyright © 2016년 YujungLee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchResults:[SearchResult] = []
    var hasSearched: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //searchBar 자리를 남겨주기 위함
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0,right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

/* search bar delegate */
extension SearchViewController: UISearchBarDelegate {
    
    //상태바 색깔 맞춤 
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()//search button누르고 나면 keyboard resign
        hasSearched = true
        searchResults = [SearchResult]()
        
        if searchBar.text! != "Lemon"{
            for i in 0...2{
                let result = SearchResult()
                result.name = String(format: "Fake result %d for", i)
                result.artistName = searchBar.text!
                searchResults.append(result)
            }
        }
       // print("The search text is: '\(searchBar.text!)'")
        tableView.reloadData()
    }
}

//table view data source
extension SearchViewController: UITableViewDataSource{
    //number of rows in section, cell for row at index path가 기본
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if !hasSearched{
            return 0
        }
        else if searchResults.count == 0{//이렇게 안하면 화면에 뜨는 cell이 0이므로 nothing found를 띄울수없다
            return 1
        }
        else {
            return searchResults.count
        }
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "SearchResultCell"
        
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle,
                                   reuseIdentifier: cellIdentifier)
        }
        
        if searchResults.count == 0{
            cell.textLabel!.text = "nothing found!"
            cell.detailTextLabel!.text = ""
        }
        else{
            let result = searchResults[indexPath.row]
            cell.textLabel!.text = result.name
            cell.detailTextLabel!.text = result.artistName
        }
        return cell
    }
    
}

//table view delegate
extension SearchViewController: UITableViewDelegate{
    
    
    func tableView(tableView: UITableView,
                   didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //선택 후 바로 선택해제
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView,
                   willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        //data가 있는 cell만 선택되도록
        if searchResults.count == 0 {
            return nil
        }
        else {
            return indexPath
        }
    }
    
}