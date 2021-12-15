import UIKit

class ProfileHeaderView: UIView {
    let titleLabel = UILabel()
    let statusLabel = UILabel()
    let textField = UITextField()
    private var statusText: String = ""
    let image = UIImage(named: "dog")
    let imageView = UIImageView()
    let showButton = UIButton(type: .system)
    
    func addSubview(){
        addSubview(titleLabel)
        addSubview(statusLabel)
        addSubview(textField)
        addSubview(imageView)
        addSubview(showButton)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.text = "Dog Profile"
        titleLabel.numberOfLines = 0
        
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = "Dog Status..."
        statusLabel.numberOfLines = 0
        
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .blue
        textField.placeholder = "Enter here"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 75
        
        showButton.layer.cornerRadius = 4
        showButton.backgroundColor = .blue
        showButton.setTitle("Show Status", for: .normal)
        showButton.setTitleColor(.white, for: .normal)
        showButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showButton.layer.shadowRadius = 4
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOpacity = 0.7
        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x: imageView.frame.width + 54, y: safeAreaInsets.top + 27, width: frame.width, height: titleLabel.frame.height)
        
        statusLabel.sizeToFit()
        statusLabel.frame = CGRect(x: imageView.frame.width + 54, y: titleLabel.frame.height + safeAreaInsets.top + 75, width: frame.width, height: statusLabel.frame.height)
        
        textField.sizeToFit()
        textField.frame = CGRect(x: imageView.frame.width + 54, y: titleLabel.frame.height + safeAreaInsets.top + statusLabel.frame.height + 27 + 75, width: frame.width - 248, height: 40)
        
        imageView.frame = CGRect(x: 16, y: safeAreaInsets.top + 16, width: 150, height: 150)
        
        showButton.frame = CGRect(x: 16, y: imageView.frame.height + safeAreaInsets.top + 57, width: frame.width - 32, height: 50)
    }
    
    @objc func buttonPressed() {
        //MARK: Задание 1
        print(statusLabel.text ?? "Status button pressed")
        
        //MARK: Задание 2
        statusLabel.text = textField.text
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusLabel.text = statusText
    }
}
