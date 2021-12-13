import UIKit

class LogInViewController: UIViewController {
    
    let logoImage = UIImage(named: "logo")
    let vkLogoImageView = UIImageView()
    let emailTextField = UITextField()
    let passTextField = UITextField()
    let loginButton = UIButton(type: .system)
    let stackView = UIStackView()
    let scrollView = UIScrollView()
    let contantView = UIView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: vkLogoImageView
        vkLogoImageView.image = logoImage
        vkLogoImageView.clipsToBounds = true
        vkLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        contantView.addSubview(vkLogoImageView)
        
        //MARK: loginButton
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor(named: "ColorVK")
        loginButton.layer.cornerRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        contantView.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        //MARK: emailTextField
        emailTextField.placeholder = "Email or phone"
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.cornerRadius = 10
        emailTextField.textColor = .black
        emailTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailTextField.tintColor = .blue
        emailTextField.autocapitalizationType = .none
        emailTextField.backgroundColor = .systemGray6
        contantView.addSubview(emailTextField)
        
        //MARK: passTextField
        passTextField.placeholder = "Password"
        passTextField.layer.borderColor = UIColor.lightGray.cgColor
        passTextField.layer.borderWidth = 0.5
        passTextField.layer.cornerRadius = 10
        passTextField.textColor = .black
        passTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passTextField.tintColor = .blue
        passTextField.autocapitalizationType = .none
        passTextField.backgroundColor = .systemGray6
        passTextField.isSecureTextEntry = true
        contantView.addSubview(passTextField)
        
        
        //MARK: stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passTextField)
        contantView.addSubview(stackView)
        
        //MARK: scrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        //MARK: contantView
        contantView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contantView)
        
        //MARK: Constraints
        NSLayoutConstraint.activate([
            
            //MARK: scrollView
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            //MARK: contantView
            contantView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            contantView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            contantView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            contantView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor),
            
            //MARK: vkLogoImageView
            vkLogoImageView.topAnchor.constraint(equalTo: contantView.topAnchor, constant: 120),
            vkLogoImageView.heightAnchor.constraint(equalToConstant: 100),
            vkLogoImageView.widthAnchor.constraint(equalToConstant: 100),
            vkLogoImageView.centerXAnchor.constraint(equalTo: contantView.centerXAnchor),
            
            //MARK: stackView
            stackView.centerXAnchor.constraint(equalTo: contantView.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: vkLogoImageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contantView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contantView.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            passTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //MARK: loginButton
            loginButton.trailingAnchor.constraint(equalTo: contantView.trailingAnchor, constant: -16),
            loginButton.leadingAnchor.constraint(equalTo: contantView.leadingAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
         ])
    }
    
    //MARK: loginButton
    @objc func buttonAction(sender: UIButton!) {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    //MARK: Keyboard
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

}
