import UIKit

class ProfileHeaderView: UIView {
    let fullNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Dog Name"
        label.numberOfLines = 0
        label.toAutoLayout()
        
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Dog Status..."
        label.numberOfLines = 0
        label.toAutoLayout()
        
        return label
    }()
    
    let statusTextField:UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .blue
        textField.placeholder = "Enter here"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.toAutoLayout()
        
        return textField
    }()
    
    private var statusText: String = ""
    
    let avatarImageView: UIImageView = {
        let image = UIImage(named: "dog")
        let imageView = UIImageView()
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = imageView.frame.height/3
        imageView.toAutoLayout()
        
        return imageView
    }()
    
    let setStatusButton: UIButton = {
        let statusButton = UIButton(type: .system)
        statusButton.layer.cornerRadius = 4
        statusButton.backgroundColor = .blue
        statusButton.setTitle("Show Status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusButton.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        
        return statusButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        
        setSubviews()
        
        avatarImageConstraints()
        fullNameLabelConstraints()
        statusLabelConstraints()
        statusButtonConstraints()
        statusTextFieldConstraints()
    }
    
    //MARK: - addSubview
    func setSubviews() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
    }
    
    //MARK: - avatarImageView
    func avatarImageConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant:  16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    //MARK: - fullNameLabel
    func fullNameLabelConstraints() {
        let navigationBarHeight = CGFloat(self.safeAreaInsets.top)
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27 + navigationBarHeight),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
        ])
    }
    
    //MARK: - statusLabel
    func statusLabelConstraints(){
        NSLayoutConstraint.activate([
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 40),
        ])
    }
    
    //MARK: - setStatusButton
    func statusButtonConstraints(){
        NSLayoutConstraint.activate([
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -27),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 54),
        ])
    }
    
    //MARK: - statusTextField
    func statusTextFieldConstraints(){
        NSLayoutConstraint.activate([
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
    
    //MARK: - buttonPressed func
    @objc func buttonPressed() {
        print(statusLabel.text ?? "Status button pressed")
        statusLabel.text = statusTextField.text
    }
    
    //MARK: - statusTextChanged func
    @objc func statusTextChanged(_ textField: UITextField){
        statusLabel.text = statusText
    }
}
