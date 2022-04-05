import UIKit
import SnapKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "ProfileHeaderView"
    
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
        imageView.layer.cornerRadius = 50
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
        statusButton.addTarget(ProfileHeaderView.self, action: #selector(buttonPressed), for: .touchUpInside)
        statusButton.addTarget(ProfileHeaderView.self, action: #selector(statusTextChanged), for: .editingChanged)
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        
        return statusButton
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setSubviews()
        
        avatarImageConstraints()
        fullNameLabelConstraints()
        statusLabelConstraints()
        statusButtonConstraints()
        statusTextFieldConstraints()
        
    }
    
    override func draw(_ rect: CGRect) {
        let view = UIView()
        view.frame = rect
        self.backgroundView = view
        self.backgroundView?.backgroundColor = UIColor.lightGray
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
        avatarImageView.snp.makeConstraints { make in
            make.leading.top.equalTo(16)
            make.height.equalTo(avatarImageView.snp.width)
            make.width.equalTo(100)
            
        }
        
//        NSLayoutConstraint.activate([
//            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant:  16),
//            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
//            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
//        ])
    }
    
    //MARK: - fullNameLabel
    func fullNameLabelConstraints() {
        
        fullNameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarImageView.snp.right).offset(20)
            make.top.equalTo(self.snp.top).offset(20)
        }
//
//        let navigationBarHeight = CGFloat(self.safeAreaInsets.top)
//        NSLayoutConstraint.activate([
//            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27 + navigationBarHeight),
//            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
//        ])
    }
    
    //MARK: - statusLabel
    func statusLabelConstraints(){
        statusLabel.snp.makeConstraints { make in
            make.leading.equalTo(fullNameLabel.snp.leading)
            make.top.equalTo(fullNameLabel.snp.bottom).offset(40)
        }
        
//        NSLayoutConstraint.activate([
//            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
//            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 40),
//        ])
    }
    
    //MARK: - setStatusButton
    func statusButtonConstraints(){
        setStatusButton.snp.makeConstraints { make in
            make.trailing.equalTo(-27)
            make.leading.equalTo(27)
            make.height.equalTo(50)
            make.top.equalTo(statusLabel.snp.bottom).offset(54)
        }
        
//        NSLayoutConstraint.activate([
//            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -27),
//            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),
//            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
//            setStatusButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 54),
//        ])
    }
    
    //MARK: - statusTextField
    func statusTextFieldConstraints(){
        statusTextField.snp.makeConstraints { make in
            make.leading.equalTo(statusLabel.snp.leading)
            make.trailing.equalTo(setStatusButton.snp.trailing)
            make.bottom.equalTo(setStatusButton.snp.top).offset(-5)
            make.height.equalTo(40)
        }
//
//        NSLayoutConstraint.activate([
//            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
//            statusTextField.trailingAnchor.constraint(equalTo: setStatusButton.trailingAnchor),
//            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -5),
//            statusTextField.heightAnchor.constraint(equalToConstant: 40),
//        ])
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
