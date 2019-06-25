//
//  ViewController.swift
//  01 - Swift-tableview
//
//  Created by CQKJ on 2019/6/25.
//  Copyright © 2019 CQKJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupUI()
        
        view.addSubview(tableView)
        
        // Do any additional setup after loading the view.
    }
    

    //tableView 的懒加载
    
    lazy var tableView : UITableView = {
        
        let tableView = UITableView()
        
        tableView.frame = view.bounds
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        return tableView
    }()
    
    
    lazy var dataArr : [Any] = {
       
        var mutableArr : [Any] = [Any]()
        
        return mutableArr
        
    }()
        
     
}


//
extension ViewController{
    
    
//    func setupUI() {
//
//        let tableView = UITableView()
//
//        tableView.frame = view.bounds
//
//        tableView.delegate = self
//
//        tableView.dataSource = self
//
//        view.addSubview(tableView)
//
//    }
    
}


extension ViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellID = "CellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: CellID)
        
        if cell == nil {
            // 在swift中使用枚举: 1> 枚举类型.具体的类型 2> .具体的类型
            cell = UITableViewCell(style: .default, reuseIdentifier: CellID)
        }
        
        // 2.给cell设置数据
        cell?.textLabel?.text = "测试数据:\(indexPath.row)"
        
        // 3.返回cell
        return cell!
        
    }
    
}

extension ViewController : UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        print(indexPath.row)
        
    }
}
