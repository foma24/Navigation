import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Background
        view.backgroundColor = .white
        
        //MARK: Post button
        let postButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        postButton.backgroundColor = .red
        postButton.setTitle("POST", for: .normal)
        postButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(postButton)
    }
    
    //MARK: - Post button tapped
    @objc func buttonAction(sender: UIButton!) {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
        
        let post = Post(title: "Post")
        postVC.navigationItem.title = post.title
        postVC.title = post.title
    }
}
