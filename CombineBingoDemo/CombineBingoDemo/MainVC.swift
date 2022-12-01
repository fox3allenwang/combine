//
//  MainVC.swift
//  CombineBingoDemo
//
//  Created by Wang Allen on 2022/12/1.
//

import UIKit
import Combine

class MainVC: UIViewController {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var txf: UITextField!
    var m_size: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewModel().$isDieAready.sink { [weak self] _ in
            if (ViewModel().isDieAready == true){
                
                self?.btn.backgroundColor = .blue
                
            }else {
                self?.btn.backgroundColor = .red
            }
        }
        bindUIControlEvent()
        setUI()
    }
    func bindUIControlEvent(){
        txf.publisher(for: .editingDidEnd).sink { [unowned self] _ in
            m_size = Int(txf.text!) ?? 500
        }
    }

    func setUI(){
        btn.publisher(for: .touchUpInside).sink { _ in } receiveValue: { [self] _ in
            ViewModel().isDie()
        }
    }

}

