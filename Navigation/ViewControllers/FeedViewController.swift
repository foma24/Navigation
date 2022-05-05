import UIKit

class FeedViewController: UIViewController {
    
    lazy private var firstButton: UIButton = {
        var firstButton = UIButton()
        firstButton.toAutoLayout()
        firstButton.backgroundColor = .blue
        firstButton.setTitle("First Button", for: .normal)
        firstButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return firstButton
    }()
    
    lazy private var secondButton: UIButton = {
        var secondButton = UIButton()
        secondButton.toAutoLayout()
        secondButton.backgroundColor = .red
        secondButton.setTitle("Second Button", for: .normal)
        secondButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return secondButton
    }()
    
    lazy private var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Feed"
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        stackView.spacing = 24
        stackView.distribution = .fillEqually
        view.backgroundColor = .white
        setupConstraints()
    }
    
    //MARK: - setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: self.view.bounds.width/2),
            stackView.heightAnchor.constraint(equalToConstant: self.view.bounds.height/4),
        ])
    }
    
    //MARK: - button tapped
    @objc private func buttonTapped() {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
}
