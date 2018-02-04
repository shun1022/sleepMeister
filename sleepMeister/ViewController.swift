//
//  ViewController.swift
//  sleepMeister
//
//  Created by shun on 2018/01/31.
//  Copyright © 2018年 shun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = getNowTime()
        _ = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var DP: UIDatePicker!
    
    private var tempTime: String = "00:00"
    private var setTime : String = "00:00"
    
    @IBAction func DPFunc(_ sender: Any) {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        tempTime = format.string(from: DP.date)
        
    }
    @IBAction func alarmSetBtn(_ sender: Any) {
        setTime = tempTime
    }
    
    func getNowTime()->String{
        let nowTime: NSDate = NSDate()
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let nowTimeStr = format.string(from: nowTime as Date)
        return nowTimeStr
    }
    
    func update(){
        let str = getNowTime()
        label.text = str
        myAlarm(str: str)
    }
    
    func myAlarm(str: String){
        func alert(){
            let myAlert = UIAlertController(title: "alert", message:"ring ding", preferredStyle: .alert)
            let myAction = UIAlertAction(title: "止める", style: .default){
                action in print("foo!")
            }
            myAlert.addAction(myAction)
            present(myAlert, animated: true, completion: nil)
        };        if str == setTime{
            alert()
        }
        
    }
}

