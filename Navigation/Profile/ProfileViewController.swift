import UIKit

class ProfileViewController: UIViewController {
    
    let newButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //MARK: ProfileHeader
        let profileView = ProfileHeaderView(frame: self.view.frame)
        view.addSubview(profileView)
        
        //MARK: newButton
        newButton.setTitle("NEW Button", for: .normal)
        newButton.setTitleColor(.white, for: .normal)
        newButton.backgroundColor = .red
        newButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newButton)
        
        //MARK: Constraints
        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //MARK: profileView
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 220),
            
            //MARK: newButton
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 50),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         ])
        

    }
}
