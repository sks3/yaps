//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
  
  var businesses: [Business]!

  
  @IBOutlet var tableView: UITableView!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 135
    
    let searchBar = UISearchBar()
    searchBar.delegate = self
    searchBar.placeholder = "Search Yelp for Businesses"
    searchBar.isTranslucent = true
    searchBar.searchBarStyle = .minimal
    self.navigationItem.titleView = searchBar

    Business.searchWithTerm(term: "", completion: { (businesses: [Business]?, error: Error?) -> Void in
      self.businesses = businesses
      self.tableView.reloadData()
    }
    )
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    if let searchText = searchBar.text {
      Business.searchWithTerm(term: searchText, completion: { (businesses: [Business]?, error: Error?) -> Void in
        self.businesses = businesses
        self.tableView.reloadData()
      }
      )
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if businesses != nil {
      return businesses!.count
    } else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
    cell.selectionStyle = .none
    cell.business = businesses[indexPath.row]
    return cell
  }
  
  // pass business object to detail view
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let cell = sender as! BusinessCell
    if let indexPath = tableView.indexPath(for: cell) {
      let business = businesses[indexPath.row]
      let detailViewController = segue.destination as! BusinessDetailViewController
      detailViewController.business = business
    }
  }
  
}
