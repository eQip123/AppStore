//
//  MainViewController.swift
//  AppStore
//
//  Created by Эмир Кармышев on 19.10.22.
//

import Foundation
import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private lazy var givingShine: UIImageView = {
        let view = UIImageView(image: UIImage(named: "Shine"))
        return view
    }()
    
    private lazy var orderTableView: UITableView = {
        let view = UITableView()
        view.layer.borderColor = UIColor.gray.cgColor
        view.rowHeight = 83
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        view.backgroundColor = .white
        
        view.addSubview(givingShine)
        givingShine.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(22)
        }
        view.addSubview(orderTableView)
        orderTableView.snp.makeConstraints { make in
            make.top.equalTo(givingShine.snp.bottom).offset(19)
            make.left.equalToSuperview().offset(22)
            make.right.equalToSuperview().offset(-22)
            make.bottom.equalToSuperview().offset(-42)
        }
    }
}
extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
