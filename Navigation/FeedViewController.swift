import UIKit

class FeedViewController: UIViewController {
    
    let firshButton = UIButton(type: .system)
    let secondButton = UIButton(type: .system)
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Background
        view.backgroundColor = .white
        
        firstButtonFunc()
        secondButtonFunc()
        
        stackFunc()
    }
    
    //MARK: - firshButton
    func firstButtonFunc() {
        firshButton.setTitle("Button ONE", for: .normal)
        firshButton.setTitleColor(.white, for: .normal)
        firshButton.backgroundColor = .red
        firshButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firshButton)
        firshButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    //MARK: - secondButton
    func secondButtonFunc(){
        secondButton.setTitle("Button TWO", for: .normal)
        secondButton.setTitleColor(.white, for: .normal)
        secondButton.backgroundColor = .blue
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondButton)
        secondButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    //MARK: - Buttons tapped
    @objc func buttonAction(sender: UIButton!) {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
        
        let post = Post(title: "Post")
        postVC.navigationItem.title = post.title
        postVC.title = post.title
    }
    
    //MARK: - stackView
    func stackFunc(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.addArrangedSubview(firshButton)
        stackView.addArrangedSubview(secondButton)
        view.addSubview(stackView)
        
        //MARK: Constraints
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
