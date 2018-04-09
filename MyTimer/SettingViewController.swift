//
//  SettingViewController.swift
//  MyTimer
//
//  Created by shima on 2018/04/02.
//  Copyright © 2018年 shima. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // UIPickerViewに表示するデータをArrayで作成
    let settingArray : [Int] = [10, 20, 30, 40, 50, 60]
    
    // 設定値を覚えるキーを設定
    let settingKey = "timer_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var timerSettingPicker: UIPickerView!
    
    @IBAction func decisionButtonAction(_ sender: Any) {
    }
}
