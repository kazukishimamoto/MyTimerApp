//
//  ViewController.swift
//  MyTimer
//
//  Created by shima on 2018/04/02.
//  Copyright © 2018年 shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //タイマーの変数作成
    var timer : Timer?
    //カウントの変数作成
    var count = 0
    //設定値を扱うキーを設定
    let settingKey = "timer_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //UserDefaultsのインスタンスを生成
        let settings = UserDefaults.standard
        //UserDefaultsに初期値を登録
        settings.register(defaults: [settingKey:10])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBAction func settingButtonAction(_ sender: Any) {
        if let nowTimer = timer {
            //もしタイマーが実行中だったら停止
            if nowTimer.isValid == true {
                //タイマー停止
                nowTimer.invalidate()
            }
        }
        
        //画面遷移を行う
        performSegue(withIdentifier: "goSetting", sender: nil)
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        //timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            //もしタイマーが実行中だったらスタートしない
            if nowTimer.isValid == true {
                return
            }
        }
        
        //タイマーをスタート
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(self.timerInterrupt(_:)),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        //timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            //もしタイマーが実行中だったら停止
            if nowTimer.isValid == true {
                //タイマー停止
                nowTimer.invalidate()
            }
        }
    }
    
    //画面の更新をする(戻り値: remainCount:残り時間)
    func displayUpdate() -> Int {
        
        //UserDefaultsのインスタンスを生成
        let settings = UserDefaults.standard
        //取得した秒数をtimerValueに渡す
        let timerValue = settings.integer(forKey: settingKey)
        //残り時間を生成
        let remainCount = timerValue - count
        //remainCountをラベルに表示
        countDownLabel.text = "残り\(remainCount)秒"
        //残り時間を戻り値に設定
        return remainCount
    }
    
    //経過時間の処理
    @objc func timerInterrupt(_ timer:Timer){
        //経過時間に+1していく
        count += 1;
        //remainCountが0以下の時，タイマーを止める
        if displayUpdate() <= 0 {
            count = 0
            timer.invalidate()
        }
    }
    
    //画面切り替えのタイミングで処理を行う
    override func viewDidAppear(_ animated: Bool) {
        //カウントをゼロにする
        count = 0
        //タイマーの表示を更新する
        _ = displayUpdate()
    }
}
