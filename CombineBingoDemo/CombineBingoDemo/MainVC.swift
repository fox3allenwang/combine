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
    let m_viewModel = ViewModel()
    var m_obsercer: Set<AnyCancellable> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUIControlEvent()
        m_viewModel.$isDieAready.sink { [weak self] vlaue in
            if (vlaue == true){
                self?.btn.backgroundColor = .blue
                
            }else {
                self?.btn.backgroundColor = .red
            }
        }.store(in: &m_obsercer)
        setUI()
    }
    func bindUIControlEvent(){
        txf.publisher(for: .editingChanged).sink { [unowned self] _ in
            m_viewModel.m_size = Int(txf.text!) ?? 0
        }.store(in: &m_obsercer)
    }

    func setUI(){
        btn.publisher(for: .touchUpInside).sink { [weak self]_ in
            self?.m_viewModel.isDie()
        }.store(in: &m_obsercer)
    }

}

