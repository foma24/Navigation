import UIKit

class PostViewController: UIViewController, UINavigationBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Background
        view.backgroundColor = .white
        
        //MARK: Info bar button
        let postBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(infoButtonTapped))
        self.navigationItem.rightBarButtonItem  = postBarButtonItem
        
    }
    
    //MARK: - Info button tapped
    @objc func infoButtonTapped() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true, completion: nil)
    }
}
