//
//  ProductListViewController.swift
//  Class003
//
//  Created by L20102 on 2019/6/17.
//  Copyright © 2019 L20102-02. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier ) as! MyTableViewCell
        
        
        let title : String = array[indexPath.row]
        //guard let title : String
        
        cell.updateContent(content: title)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedContent = array[indexPath.row]
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "moveToDetailSegue", sender: self)
        }
        
        
    }
    
    
    var selectedContent : String?
    

    var array : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        array =  ["a","The Apple Developer Program License Agreement has been updated.In order to access certain membership resources, Yu Chang Wu must accept the latest license agreement by June 17, 2019.","c"]
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if( segue.identifier == "moveToDetailSegue"){
           let destination = segue.destination as! DetailViewController
            
            destination.content = self.selectedContent
        }
    }
 

}
