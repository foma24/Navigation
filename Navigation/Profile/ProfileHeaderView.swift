import UIKit

class ProfileHeaderView: UIView {
    
    let fullNameLabel = UILabel()
    let statusLabel = UILabel()
    let statusTextField = UITextField()
    private var statusText: String = ""
    let image = UIImage(named: "dog")
    let avatarImageView = UIImageView()
    let setStatusButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        
        //MARK: avatarImageView
        avatarImageView.image = image
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.cornerRadius = 75
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: fullNameLabel
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.text = "Dog Name"
        fullNameLabel.numberOfLines = 0
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: statusLabel
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = "Dog Status..."
        statusLabel.numberOfLines = 0
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: statusTextField
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .blue
        statusTextField.placeholder = "Enter here"
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: setStatusButton
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.backgroundColor = .blue
        setStatusButton.setTitle("Show Status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setStatusButton.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: addSubview
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)

        //MARK: Constraints
        let navigationBarHeight = CGFloat(self.safeAreaInsets.top)
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: navigationBarHeight + 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: self.frame.width / 3),
            avatarImageView.widthAnchor.constraint(equalToConstant: self.frame.width/3),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27 + navigationBarHeight),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 40),
            
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -27),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 54),
            
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: setStatusButton.trailingAnchor),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -5),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
    }
    
    //MARK: Button pressed func
    @objc func buttonPressed() {
        print(statusLabel.text ?? "Status button pressed")
        statusLabel.text = statusTextField.text
    }
    
    //MARK: Status changed func
    @objc func statusTextChanged(_ textField: UITextField){
        statusLabel.text = statusText
    }
}
