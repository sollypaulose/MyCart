//
//  ItemCollectionViewController.swift
//  MyCart
//
//  Created by Solly Paulose on 12/01/22.
//

import UIKit
class ItemCollectionViewController : UIViewController{
    @IBOutlet weak var ItemCollectionView: UICollectionView!
    @IBOutlet weak var AddItemButton: UIButton!
    var items = ["Apple", "Orange", "Phone", "Calculator", "Pen", "Ball", "Ballon", "Fish", "CUP", "RED", "Eraser", "Dog", "Containers", "Rose", "Pencil", "Earring", "ToothPaste", "Brush", "Lipstick", "Book", "Flower", "Laptop", "Desktop", "Bottle", "HeadPhone", "Scale", "Table", "Ring", "Oats"]
    
    var SelectedItems : [String]?
    var itemcell : ItemCollectionViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        ItemCollectionView.delegate = self
        ItemCollectionView.dataSource = self
        let defaults = UserDefaults.standard
        self.SelectedItems = defaults.array(forKey: "SavedArray") as? [String]
        print("SelectedItems",SelectedItems!)
       
    }
    @IBAction func AddItemAction(_ sender: Any) {
        let Vc = (self.storyboard?.instantiateViewController(identifier: "WishListViewController"))! as WishListViewController
        self.navigationController?.pushViewController(Vc, animated: true)
    }
    
}


extension ItemCollectionViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
        }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        print("itemq",self.items)
        print("selectedq",self.SelectedItems)
        if cell?.backgroundColor == UIColor.white{
            cell?.backgroundColor = UIColor.purple
            
        }else{
            cell?.backgroundColor = UIColor.white
            //self.SelectedItems?.remove(at: indexPath.row)
        }
       
        let newcell = collectionView.dequeueReusableCell(withReuseIdentifier: "Itemcell", for: indexPath as IndexPath) as! ItemCollectionViewCell
        newcell.ItemsLabel.text = self.items[indexPath.row]
        //cell.backgroundColor = UIColor.purple
        if cell!.backgroundColor == UIColor.purple{
            let selected = newcell.ItemsLabel.text
            if self.SelectedItems?.contains(selected!) != true{
            self.SelectedItems?.append(selected!)
            }
//            if cell!.backgroundColor == UIColor.white{
//                let selected = newcell.ItemsLabel.text
//                if self.SelectedItems?.contains(selected!) != true{
//
//                self.SelectedItems?.remove(at: indexPath.row)
//            }
//            }
    }
        
        let defaults = UserDefaults.standard
        defaults.set("value", forKey: "key")
        let passitems = self.SelectedItems
        defaults.set(passitems, forKey: "SavedArray")
        print("defaults",defaults.array(forKey: "SavedArray"))
     
  }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let defaults = UserDefaults.standard
//        print("newarray2",defaults.array(forKey: "NewArray")!)
//         var first = defaults.array(forKey: "NewArray")!
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Itemcell", for: indexPath as IndexPath) as! ItemCollectionViewCell
        cell.ItemsLabel.text = self.items[indexPath.row]
        
//        if self.SelectedItems != nil{
//            let defaults = UserDefaults.standard
//            defaults.set("value", forKey: "key")
//            let dcount = self.SelectedItems!.count
//            if first.count == dcount{
//            let newarray = self.SelectedItems
//            }else{
//                let newarray = first
//            }
//        }
//            let count = first.count
//            print("count",count)
//            let element = first.first
//                print("element",element!)
//
//            if self.items.contains(element! as! String){
//                let index = self.items.firstIndex(of: element! as! String)
//                print("index",index!)
//                if cell.ItemsLabel.text == element as? String{
//
//                    cell.backgroundColor = UIColor.purple
//                    first.remove(at: 0)
//
//                    print("first",first)
//                    let defaults = UserDefaults.standard
//                    let newarray = first
//                    defaults.set(newarray, forKey: "NewArray")
//                    print("newarray3",defaults.array(forKey: "NewArray")!)
////                    var first = defaults.array(forKey: "NewArray")
//                    first = defaults.array(forKey: "NewArray")!
//                }
//             }
        return cell
    }

}

