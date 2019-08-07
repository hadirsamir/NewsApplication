//
//  NewsViewController.swift
//  NewsApp
//
//  Created by ASamir on 7/30/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import UIKit
import RxSwift
class NewsViewController: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var newsTable : UITableView!
    
    var popVc : PopUpViewController?
    //MARK:- Objects
    let disposeBag = DisposeBag()
    let newsViewModel = NewsViewModel()
    var FilteredSourceArray :[NewsArticleModel] = [NewsArticleModel]()
    var newsObject : NewsResponseModel =  NewsResponseModel()
    var newsAricleArray :[NewsArticleModel] = [NewsArticleModel]()
    var indicator = UIActivityIndicatorView()
    var Code  : String? = "News"
    
    override func loadView() {
        super.loadView()
        //call activity indicator style function
        self.activityIndicator()
        // start Activity indicator
        self.startActvityIndicator()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTable.delegate   =  self
        self.newsTable.dataSource =  self
        self.title = "News App"
        // register cell xib files
        registerNibs()
        // set response object and call Api functions
        initListeners()
        callData()
    }
    
    func registerNibs(){
        newsTable.register(UINib(nibName: "NewsListTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsListTableViewCell")
        
        newsTable.register(UINib(nibName: "NewsListHeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "NewsListHeaderTableViewCell")
    }
    
    
    // listen to to subject event (observer)
    fileprivate func initListeners(){
        
        self.newsViewModel.objNewsRemoteObservable.asObservable().subscribe(onNext: { (newsResponse) in
            self.newsObject = newsResponse
            self.newsAricleArray.append(contentsOf: newsResponse.articles)
            DispatchQueue.main.async{
                
                self.indicator.stopAnimating()
                self.indicator.hidesWhenStopped = true
                self.newsTable.reloadData()
            }
            print(self.newsAricleArray.count)
        }, onError: { (error) in
        }, onCompleted: {
            print("yessss")
        }).disposed(by: self.disposeBag)
        
        
    }
    
    fileprivate func callData(){
        self.newsViewModel.getNewsData(type: .COUNTRY, code: NewsConstants.DEFAULT_COUNTRY_CODE)
        
    }
    
}
extension NewsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.newsAricleArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: indexPath) as! NewsListTableViewCell
        cell.headlineLabel.text = self.newsAricleArray[indexPath.row].title
        cell.publishDateLabel.text = self.newsAricleArray[indexPath.row].publishedAt
        // set image from url string
        if let url = NSURL(string:self.newsAricleArray[indexPath.row].urlToImage) {
            if let data = NSData(contentsOf: url as URL) {
                cell.newsImage.image = UIImage(data: data as Data)
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NewsListHeaderTableViewCell") as! NewsListHeaderTableViewCell
        headerView.delegate = self
        headerView.headerLabel.text = self.Code
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    // navigate to news datails view Controller by cell selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let newsDetailsVC = UIStoryboard(name: "NewsDetailsViewController", bundle: nil).instantiateViewController(withIdentifier: "NewsDetailsViewController") as! NewsDetailsViewController
        newsDetailsVC.newsObject = self.newsAricleArray[indexPath.row]
        print("pressed")
        self.navigationController?.pushViewController(newsDetailsVC, animated: true)
    }
}


extension NewsViewController : showPopUpDelegate{
    func showPobUpView() {
        let pobUpVc = UIStoryboard(name: "PopUpViewController", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        self.addChild(pobUpVc)
        pobUpVc.view.frame = self.view.frame
        pobUpVc.delegate = self
        self.view.addSubview(pobUpVc.view)
        pobUpVc.didMove(toParent: self)
    }
}
//implement showPopDelegate protocle to get data from pop up viewin current view controller
extension NewsViewController : sendDataToViewControllerDelegate{
    func sendDataToMainVC(filterType: FilterType, stringCode: String) {
        //remove current data array in viewController and call api by string Code to update data in vc
        self.newsAricleArray.removeAll()
        self.startActvityIndicator()
        self.Code = stringCode
        self.newsViewModel.getNewsData(type: filterType , code: stringCode)
        self.newsTable.reloadData()
    }
    
    //set activity indicator function
    func activityIndicator() {
        indicator.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        indicator.style = UIActivityIndicatorView.Style.white
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    //start activity indicator function
    func startActvityIndicator(){
        self.indicator.startAnimating()
        self.indicator.backgroundColor = UIColor.clear
    }
    
    
}
