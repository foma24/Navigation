import UIKit

class ProfileViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        return tableView
    }()
    
    let profileHeaderView: ProfileHeaderView = {
        let profileView = ProfileHeaderView()
        
        return profileView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        let containerView = UIView()
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.addSubview(profileHeaderView)
//        self.tableView.tableHeaderView = containerView
//        containerView.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor).isActive = true
//        containerView.widthAnchor.constraint(equalTo: self.tableView.widthAnchor).isActive = true
//        containerView.topAnchor.constraint(equalTo: self.tableView.topAnchor).isActive = true
//        containerView.heightAnchor.constraint(equalToConstant: 220).isActive = true
//
//        self.tableView.tableHeaderView?.layoutIfNeeded()
//        self.tableView.tableHeaderView = self.tableView.tableHeaderView
        
        tableViewSetup()
        //profileHeaderViewSetup()
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
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifier)
        
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifier) as! ProfileHeaderView
            
            return headerView
        } else {
            return nil
        }
    }
    
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
