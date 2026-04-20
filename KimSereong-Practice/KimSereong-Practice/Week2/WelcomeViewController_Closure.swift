//
//  WelcomeViewController_Closure.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 4/11/26.
//



import UIKit

class WelcomeViewController_Closure: UIViewController {
    
    var id: String? = nil
    
    var backToLoginCompletion : ((String) -> Void)?
    
    func configure(id: String?) {
        self.id = id
        welcomeLabel.text = "\(id ?? "")님\n반가워요!!"
    }
    
    private let logoImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        image.image = UIImage(named: "hihi")
        image.contentMode = .scaleAspectFill   // 이미지 채우기
        image.layer.cornerRadius = 75          // 원형 만들기 (width/2)
        image.clipsToBounds = true             // 영역 밖 잘라내기
        return image
    }()
    
    private let welcomeLabel : UILabel = {
        let label = UILabel(frame: CGRect(x : 95, y : 295, width: 180, height: 60))
        label.textColor = .black
        label.text = "??님\n반가워요!"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        return label
    }()
        
    private lazy var mainButton : UIButton = {
        let button = UIButton(frame : CGRect(x: 20, y: 420, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 3
        return button
    }()
        
    private lazy var backLoginButton : UIButton = {
        let button = UIButton(frame : CGRect(x: 20, y: 490, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 3
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
        setLayout()
    }
        
    private func setLayout() {
        [logoImage, welcomeLabel, mainButton, backLoginButton].forEach{self.view.addSubview($0)}
    }
        

    @objc
    private func backToLoginButtonDidTap(){
        
        guard let backToLoginCompletion else { return }
        
        if let id = id {
            backToLoginCompletion(id)
        }
        
        if (self.navigationController == nil){
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

    
}
    
    
