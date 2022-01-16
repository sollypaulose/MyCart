//
//  WishListViewController.swift
//  MyCart
//
//  Created by Solly Paulose on 12/01/22.
//

import UIKit

class WishListViewController: UIViewController {
    
    @IBOutlet weak var WishListLabel: UILabel!
    @IBOutlet weak var LogOutButton: UIButton!
    @IBOutlet weak var WishListTableview: UITableView!
    @IBOutlet weak var AddButton: UIButton!
    var itemSelected : [String]?
    var count : Int?
   
    
    override func viewDidLoad() {
    super.viewDidLoad()
    self.setupTableView()
    WishListTableview.delegate = self
    WishListTableview.dataSource = self
    self.itemSelected = [String]()
        let defaults = UserDefaults.standard
        self.itemSelected = defaults.array(forKey: "SavedArray") as! [String]
        print("itemSelected",itemSelected!)
        self.count = itemSelected?.count
        print("count",count!)
        
        
}
    func setnavbar(){
        navigationController?.navigationItem.title = "WishList"
        
    }
    func setupTableView(){
        view.addSubview(WishListTableview)
    }
    @IBAction func LogOutClicked(_ sender: Any) {
        let Vc = (self.storyboard?.instantiateViewController(identifier: "MyCartViewController"))! as MyCartViewController
        self.navigationController?.pushViewController(Vc, animated: true)
    }
    @IBAction func AddClicked(_ sender: Any) {
        let Vc = (self.storyboard?.instantiateViewController(identifier: "ItemCollectionViewController"))! as ItemCollectionViewController
        self.navigationController?.pushViewController(Vc, animated: true)
    }
    
}
extension WishListViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return self.count!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishlistcell", for: indexPath)
       cell.textLabel?.text = self.itemSelected![indexPath.row]
            
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
