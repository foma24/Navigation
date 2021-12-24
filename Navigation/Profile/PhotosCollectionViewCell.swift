import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotosCollectionViewCell"
    
    var imageViewCell: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.toAutoLayout()
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageViewCell)
        
        NSLayoutConstraint.activate([
            imageViewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
