//
//  ViewModel.swift
//  CombineBingoDemo
//
//  Created by Wang Allen on 2022/12/1.
//

import Foundation
import Combine

class ViewModel {
    @Published var isDieAready: Bool?
   
    
    func isDie(){
        if(MainVC().m_size > 100) {
            isDieAready = true
        } else {
            isDieAready = false
        }
    }
}
