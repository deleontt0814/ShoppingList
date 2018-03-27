//
//  ViewController.swift
//  Shopping List
//
//  Created by Timothy De leon on 3/24/18.
//  Copyright © 2018 Tim. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
 
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCount: UILabel!
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    
    let itemName = ["Apple", "Orange", "Banana"]
    let itemCount = [4, 10, 3]
    let imageName = ["Apple", "Orange", "Banana"]
    
    var selectedIndex = Int()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "custom")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell : CustomTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomTableViewCell
    
        cell.itemName.text = itemName[indexPath.row]
        cell.itemCount.text = "Count: \(itemCount[indexPath.row])"
        cell.itemImage.image = UIImage(named: imageName[indexPath.row])
        return cell
        
    }
    
    func tableView(_tableView: UITableViewCell, didSelectRowAt indexPath: IndexPath)
    {
        self.selectedIndex = indexPath.row
        performSegue(withIdentifier: "item", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
            if segue.identifier == "item"
            {
                let vc : ItemViewController = segue.destination as! ItemViewController
                vc.name = itemName[selectedIndex]
                vc.count = itemCount[selectedIndex]
                vc.image = imageName[selectedIndex]
            }
        
    }
    
    
}

