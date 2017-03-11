//
//  ListFieldViewController.swift
//  Book Phui
//
//  Created by thjnh195 on 3/11/17.
//  Copyright © 2017 Half Bird. All rights reserved.
//

import UIKit

protocol ListFieldDelegate {
    func didScrollUp()
    func didScrollDown()
    func didSelectItem()
}

class ListFieldViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var delegate : ListFieldDelegate!
    @IBOutlet weak var tableView: UITableView!
    var arrFelds:[AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: Constants.StoryBoardID.FieldCellID, bundle: nil), forCellReuseIdentifier: Constants.StoryBoardID.FieldCellID)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Setup table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.StoryBoardID.FieldCellID) as! FieldCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.didSelectItem()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.y <= 0.0){
            self.delegate.didScrollUp()
            
        }
        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y <= 0){
            self.delegate.didScrollDown()
            print("down")

        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
