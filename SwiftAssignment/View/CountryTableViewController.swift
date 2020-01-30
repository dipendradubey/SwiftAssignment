//
//  ViewController.swift
//  SwiftAssignment
//
//  Created by Dipendra Dubey on 21/01/20.
//  Copyright © 2020 Dipendra. All rights reserved.
//

import UIKit
import SVProgressHUD
import Kingfisher

class CountryTableViewController: UITableViewController {
    
    var arrInfoModel = [InfoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Author"
        tableView.register(CustomCell.self, forCellReuseIdentifier: Cell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        SVProgressHUD.show(withStatus: "Loading...")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ServiceManager().fetchData(Api.about) {[weak self] (response: Result<Info, Error>) in
            switch response{
            case .success (let res):
                self?.updateList(res)
                print(res)
                
            case .failure(let error):
                let error = error as NSError
                DispatchQueue.main.async {
                    let error = error as NSError
                        print(error.domain)
                    self?.showAlert("\(error.domain)============\(error.localizedDescription)")
                }
                print(error.localizedDescription)
            }
        }
    }
    
    func updateList(_ info: Info){
        //Get arrInfoModel from arrInfo
        arrInfoModel = info.rows.map({ return InfoModel($0)})
        
        //Show only those records for which title is not nil
        arrInfoModel = arrInfoModel.filter({ (arrInfoModel) -> Bool in
            arrInfoModel.name.count>0
        })
        
        DispatchQueue.main.async {
            self.title = info.title
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
        }
    }
    
    func showAlert(_ message: String){
        SVProgressHUD.dismiss()
        let alertVC = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { [weak self](alertAction) in
            self?.dismiss(animated: true, completion: nil)
        }
        alertVC.addAction(alertAction)
        present(alertVC, animated: true, completion: nil)
    }
    
}

extension CountryTableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrInfoModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as! CustomCell
        
        let info = arrInfoModel[indexPath.row]
        
        cell.picture.contentMode = .scaleAspectFit
        let placeHolder = UIImage(named: "flower")
        
        cell.picture.image = placeHolder
        if let url = info.imgUrl{
           cell.picture.kf.setImage(with: url, placeholder:placeHolder)
        }
        
//        if let urlString = info.imageHref, let url = URL(string: urlString) {
//            cell.picture.kf.setImage(with: url, placeholder:placeHolder)
//        }
        cell.lblName.text = info.name
        cell.lblDesc.text = info.desc
        
        return cell
    }
}



