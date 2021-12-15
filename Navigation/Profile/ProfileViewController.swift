import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeader = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: Background
        view.backgroundColor = .lightGray
        navigationController?.navigationBar.backgroundColor = .white
        
        //MARK: ProfileHeader
        view.addSubview(profileHeader)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        //MARK: ProfileHeader frame
        profileHeader.frame = view.frame
    }
}
