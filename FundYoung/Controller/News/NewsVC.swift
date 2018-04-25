//
//  NewsVC.swift
//  FundYoung
//
//  Created by Janjao on 14/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import Alamofire


class NewsVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsDataService.instance.getNews().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as? NewsTableCell{
            let news  = NewsDataService.instance.getNews()[indexPath.row]
            cell.updateView(news: news)
            return cell
            
        }
        else{
            return NewsTableCell()
        }
    }
    
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var NewsTable: UITableView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NewsTable.delegate = self
        NewsTable.dataSource = self
       
     
        
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let news = NewsDataService.instance.getNews()[indexPath.row]
        performSegue(withIdentifier: "newsContent", sender: news)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let content = segue.destination as? NewsContentVC{
            print("func prepare")
            assert(sender as? News != nil)
            content.initNews(news: sender as! News)
           
        }
    }
    @IBAction func unwindFromContentVC(unwindSegue : UIStoryboardSegue){
        NewsTable.reloadData()
        
        
    }
    
  

}
