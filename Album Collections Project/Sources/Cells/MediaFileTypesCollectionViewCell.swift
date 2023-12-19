
import UIKit
import SnapKit

final class MediaFileTypesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - State
    
    static let identifier = "MediaFileTypesCell"
    
    // MARK: - UIElements & Outlets
    
    private lazy var itemIcon: UIImageView = {
        let imageView  = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var itemLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var itemAmount: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup & Layout
    
    private func setupHierarchy() {
        [itemIcon, itemLabel, itemAmount].forEach {
            addSubview($0)
        }
    }
    
    private func setupLayout() {
        itemIcon.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        itemLabel.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
        
        itemAmount.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
    }
    
    func configureMediaFileTypesCell(imageName: String, label: String, amount: Int) {
        itemIcon.image = UIImage(named: imageName)
        itemLabel.text = label
        itemAmount.text = String(Int.random(in: 0...999))
    }
}
