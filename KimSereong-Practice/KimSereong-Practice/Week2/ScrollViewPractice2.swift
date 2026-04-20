//
//  ScrollViewPractice2.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 4/11/26.
//

import UIKit
import SnapKit

class ScrollViewPractice2: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let red = UIView()
    private let orange = UIView()
    private let yellow = UIView()
    private let green = UIView()
    private let blue = UIView()
    private let purple = UIView()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setUI()
            setLayout()
        }
    
    private func setUI() {
        view.backgroundColor = .white
        
        red.backgroundColor = .red
        orange.backgroundColor = .orange
        yellow.backgroundColor = .yellow
        green.backgroundColor = .green
        blue.backgroundColor = .blue
        purple.backgroundColor = .purple
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [red, orange, yellow, green, blue, purple].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { //이해 다시 하기
            $0.edges.equalToSuperview() //전체를 연결해야함!!
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        let width = UIScreen.main.bounds.width/2
        
        red.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(337)
        }
        
        orange.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(337)
            
        }
        
        yellow.snp.makeConstraints {
            $0.top.equalTo(red.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(337)
                
        }
        
        green.snp.makeConstraints {
            $0.top.equalTo(orange.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(337)
        }
        
        blue.snp.makeConstraints {
            $0.top.equalTo(yellow.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(337)
            $0.bottom.equalToSuperview()
        }
        
        purple.snp.makeConstraints {
            $0.top.equalTo(green.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(337)
            $0.bottom.equalToSuperview()
        }
        
        
    }
}
