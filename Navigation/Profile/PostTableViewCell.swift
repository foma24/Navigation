import UIKit
import StorageService

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostTableViewCell"
    
    let postAuthor: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .left
        label.toAutoLayout()
        
        return label
    }()
    
    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.toAutoLayout()
        
        return imageView
    }()
    
    let postDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.textAlignment = .left
        label.toAutoLayout()
        
        return label
    }()
    
    let postLikes: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.toAutoLayout()
        
        return label
    }()
    
    let postViews: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.toAutoLayout()
        
        return label
    }()
    
    public var post: Post? {
        didSet {
            postAuthor.text = post?.author
            postImageView.image = UIImage(named: post!.image)
            postDescription.text = post?.description
            postLikes.text = "Likes: \(post?.likes ?? 0)"
            postViews.text = "Views: \(post?.views ?? 0)"
        }
    }
    
    override var reuseIdentifier: String?{
        return "PostTableViewCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        setupViews()
        cellConstraints()
    }
    
    //MARK: - setupViews
    func setupViews() {
        contentView.addSubview(postAuthor)
        contentView.addSubview(postImageView)
        contentView.addSubview(postDescription)
        contentView.addSubview(postLikes)
        contentView.addSubview(postViews)
    }
    
    //MARK: - cellConstraints
    func cellConstraints() {
        NSLayoutConstraint.activate([
            postAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postAuthor.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            postImageView.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: 16),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            postDescription.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),])
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
