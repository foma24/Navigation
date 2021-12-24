import UIKit

class PhotosViewController: UIViewController {
    
    let photosIdentifiers = "PhotosCollectionViewCell"
    
    var collectionView: UICollectionView = {
        let collectionViewFlow = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlow)
        collectionView.backgroundColor = .white
        collectionView.toAutoLayout()
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Photo Gallery"
        
        setSubviews()
        setCollectionView()
        
    }
    
    //MARK: -setSubviews
    func setSubviews(){
        view.addSubview(collectionView)
    }
    
    //MARK: -setCollectionView
    func setCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

//MARK: - PhotosViewController extensions
extension PhotosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photosIdentifiers, for: indexPath) as! PhotosCollectionViewCell
        cell.imageViewCell.image = photosArray[indexPath.row]
        
        return cell
    }
    
    struct Constants{
        static let base: CGFloat = 8
        static let section:CGFloat = 8
    }
    
    func calcCellWidth(with collectionView:UICollectionView, cellInRow: Int)->CGFloat{
        let total: CGFloat = Constants.base * CGFloat(cellInRow - 1)
        let side: CGFloat = Constants.section * 2
        let width = (collectionView.frame.width - total - side)/CGFloat(cellInRow)
        
        return width
    }
    
    var cellWidth: CGFloat {
        return calcCellWidth(with: collectionView, cellInRow: 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.base
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.base, left: Constants.base, bottom: .zero, right: Constants.base)
    }
}
