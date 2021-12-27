import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let identifier = "PhotosTableViewCell"
    
    let photosTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        label.textColor = .black
        label.toAutoLayout()
        
        return label
    }()
    
    let photosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.toAutoLayout()
        
        return stackView
    }()
    
    let imageView1: UIImageView = {
        let image = UIImage(named: "photo")
        let imageView = UIImageView()
        imageView.image = image
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        
        return imageView
    }()
    
    let imageView2: UIImageView = {
        let image = UIImage(named: "photo2")
        let imageView = UIImageView()
        imageView.image = image
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        
        return imageView
    }()
    
    let imageView3: UIImageView = {
        let image = UIImage(named: "photo3")
        let imageView = UIImageView()
        imageView.image = image
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        
        return imageView
    }()
    
    let imageView4: UIImageView = {
        let image = UIImage(named: "photo4")
        let imageView = UIImageView()
        imageView.image = image
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        
        return imageView
    }()
    
    let photosButton: UIButton = {
        let image = UIImage(systemName: "arrow.right")
        let button = UIButton()
        button.setBackgroundImage(image, for: .normal)
        button.tintColor = .black
        button.clipsToBounds = true
        button.toAutoLayout()
        
        return button
    }()
    
    struct Constants {
        static let sideConst:CGFloat = 12
        static let intervalConst: CGFloat = 8
    }
    
    //MARK: - reuseIdentifier
    override var reuseIdentifier: String?{
        return "PhotosTableViewCell"
    }
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        setSubviews()
        setStackView()
        setPhotoTitle()
        setPhotosButton() 
    }
    
    //MARK: - setSubviews
    func setSubviews(){
        contentView.addSubview(photosTitle)
        contentView.addSubview(photosStackView)
        contentView.addSubview(photosButton)
    }
    
    //MARK: - setStackView
    func setPhotoTitle(){
        NSLayoutConstraint.activate([
            photosTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.sideConst),
            photosTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sideConst),
        ])
    }
    
    //MARK: - setPhotosButton
    func setPhotosButton() {
        NSLayoutConstraint.activate([
            photosButton.centerYAnchor.constraint(equalTo: photosTitle.centerYAnchor),
            photosButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sideConst),
            photosButton.widthAnchor.constraint(equalToConstant: 30),
            photosButton.heightAnchor.constraint(equalTo: photosButton.widthAnchor)
        ])
    }
    
    //MARK: - setStackView
    func setStackView(){
        photosStackView.addArrangedSubview(imageView1)
        photosStackView.addArrangedSubview(imageView2)
        photosStackView.addArrangedSubview(imageView3)
        photosStackView.addArrangedSubview(imageView4)
        
        NSLayoutConstraint.activate([
            photosStackView.topAnchor.constraint(equalTo: photosTitle.bottomAnchor, constant: Constants.sideConst),
            photosStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sideConst),
            photosStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sideConst),
            photosStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.sideConst),
            photosStackView.heightAnchor.constraint(equalToConstant: (contentView.frame.size.width - Constants.sideConst * 2 - Constants.intervalConst * 3) / 4),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
