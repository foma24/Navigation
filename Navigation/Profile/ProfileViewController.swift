import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        return tableView
    }()
    
    let profileHeaderView: ProfileHeaderView = {
        let profileView = ProfileHeaderView()
        
        return profileView
    }()
    
    lazy var avatarImageView: UIImageView = {
        avatarImageView = UIImageView(image: UIImage(named: "dog"))
        avatarImageView.frame = self.avatarImageView.frame
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return avatarImageView
    }()
    
    lazy var avatarView: UIView = {
        avatarView = UIView()
        avatarView.frame = self.view.frame
        avatarView.addSubview(avatarImageView)
        avatarView.addSubview(closeButton)
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        
        return avatarView
    }()
    
    lazy var closeButton : UIButton = {
        closeButton = UIButton()
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.contentVerticalAlignment = .fill
        closeButton.contentHorizontalAlignment = .fill
        closeButton.alpha = 0
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        return closeButton
    }()
    
    var openAvatarConstraints: [NSLayoutConstraint] = []
    var closeAvatarConstraints: [NSLayoutConstraint] = []
    
    lazy var transparentView: UIView = {
        transparentView = UIView()
        transparentView.frame = self.view.frame
        transparentView.backgroundColor = .black
        transparentView.alpha = 0
        
        return transparentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableViewSetup()
        profileHeaderViewSetup()
        
        profileHeaderView.layoutIfNeeded()
        
        let gestureOpen = UITapGestureRecognizer(
            target: self,
            action: #selector(hanbleOpenTapGestureRecognizer)
        )
        let gestureClose = UITapGestureRecognizer(
            target: self,
            action: #selector(hanbleCloseTapGestureRecognizer)
        )
        self.profileHeaderView.avatarImageView.isUserInteractionEnabled = true
        avatarImageView.isUserInteractionEnabled = true
        self.profileHeaderView.avatarImageView.addGestureRecognizer(gestureOpen)
        self.closeButton.addGestureRecognizer(gestureClose)
    }
    
    //MARK: - hanbleOpenTapGestureRecognizer
    @objc private func hanbleOpenTapGestureRecognizer(gesture: UITapGestureRecognizer){
        
        self.profileHeaderView.avatarImageView.alpha = 0.0
        self.view.addSubview(transparentView)
        self.view.addSubview(avatarView)
        setLayoutForAvatar()
        setAvatarImage()
        
        let animationCornerRadius = CABasicAnimation(keyPath: "cornerRadius")
        animationCornerRadius.toValue = 0
        animationCornerRadius.duration = 0.5
        animationCornerRadius.isRemovedOnCompletion = false
        animationCornerRadius.fillMode = .forwards
        self.avatarImageView.layer.add(animationCornerRadius, forKey: "avatarViewAnimationCornerRadius")
        
        UIView.animate(withDuration: 0.5) {
            NSLayoutConstraint.deactivate(self.openAvatarConstraints)
            NSLayoutConstraint.activate(self.closeAvatarConstraints)
            
            self.view.layoutIfNeeded()
            self.transparentView.alpha = 0.5
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.closeButton.alpha = 1
        }
    }
    
    //MARK: - hanbleOpenTapGestureRecognizer
    @objc private func hanbleCloseTapGestureRecognizer(gesture: UITapGestureRecognizer){
        UIView.animate(withDuration: 0.3) {
            self.closeButton.alpha = 0
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.3) {
            NSLayoutConstraint.deactivate(self.closeAvatarConstraints)
            NSLayoutConstraint.activate(self.openAvatarConstraints)
            
            self.view.layoutIfNeeded()
            self.transparentView.alpha = 0
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200), execute: {
            let animationCornerRadius = CABasicAnimation(keyPath: "cornerRadius")
            animationCornerRadius.fromValue = 0
            animationCornerRadius.toValue = self.avatarImageView.bounds.height / 2
            animationCornerRadius.duration = 0.5
            self.avatarImageView.layer.add(animationCornerRadius, forKey: "avatarViewAnimationCornerRadius")
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
            self.profileHeaderView.avatarImageView.alpha = 1
            self.transparentView.removeFromSuperview()
            self.avatarView.removeFromSuperview()
            NSLayoutConstraint.deactivate(self.openAvatarConstraints)
        })
        
    }
    
    //MARK: -setLayoutForAvatar
    private func setLayoutForAvatar(){
        
        let navBarHeight = CGFloat(self.view.safeAreaInsets.top)
        
        let viewConstraints = [
            avatarView.topAnchor.constraint(equalTo: self.view.topAnchor),
            avatarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            avatarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            avatarView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ]
        
        let buttonConstrants = [
            closeButton.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: -16),
            closeButton.topAnchor.constraint(equalTo: avatarView.topAnchor, constant: navBarHeight + 16),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.widthAnchor.constraint(equalToConstant: 50),
        ]
        
        openAvatarConstraints = [
            avatarImageView.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: avatarView.topAnchor, constant: 16 + navBarHeight),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarView.frame.width/3),
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarView.frame.width/3),
        ]
        
        closeAvatarConstraints = [
            avatarImageView.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalTo: avatarView.widthAnchor),
            avatarImageView.heightAnchor.constraint(equalTo: avatarView.widthAnchor),
        ]
        
        NSLayoutConstraint.activate(openAvatarConstraints + viewConstraints + buttonConstrants)
    }
    
    //MARK: -setAvatarImage
    private func setAvatarImage() {
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
    }
    
    //MARK: - tableViewSetup
    func tableViewSetup() {
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.toAutoLayout()
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        //tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //MARK: - profileHeaderViewSetup
    func profileHeaderViewSetup(){
        profileHeaderView.toAutoLayout()
        tableView.tableHeaderView = profileHeaderView
        
        NSLayoutConstraint.activate([
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderView.widthAnchor.constraint(equalTo: tableView.widthAnchor),
            profileHeaderView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: tableView.topAnchor)
        ])
    }
}

//MARK: -Tableview
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return postArray.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.post = postArray[indexPath.row]
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        if section == 0 {
    //            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifier) as! ProfileHeaderView
    //
    //            return headerView
    //        } else {
    //            return nil
    //        }
    //    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosViewController = PhotosViewController()
            self.navigationController?.pushViewController(photosViewController, animated: true)
        }
    }
}
