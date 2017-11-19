//
//  CardInfoViewController.swift
//  TagReader
//
//  Created by WeiKang on 2017/11/19.
//  Copyright © 2017年 Jameson Quave. All rights reserved.
//

import UIKit

class CardInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addRightItem()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addRightItem(){
        // 導覽列右邊按鈕
        let rightButton = UIBarButtonItem(
            title:"儲存",
            style:.plain,
            target:self,
            action:#selector(self.store))
        // 加到導覽列中
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func store(){
        
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
