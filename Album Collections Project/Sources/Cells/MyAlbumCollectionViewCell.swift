
import UIKit
import SnapKit

final class MyAlbumCollectionViewCell: UICollectionViewCell {
    
    // MARK: - State
    
    static let identifier = "MyAlbumsCell"
    
    // MARK: - UIElements & Outlets
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.layer.shouldRasterize = true
        imageView.layer.rasterizationScale = UIScreen.main.scale
        return imageView
    }()
    
    lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .left
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
    
    // MARK: - Setup, Layout & Configuration
    
    private func setupHierarchy() {
        [imageView, albumLabel, amountLabel].forEach {
            addSubview($0)
        }
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(160)
        }
        
        albumLabel.snp.makeConstraints { make in
            make.width.equalTo(imageView)
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.height.equalTo(16)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.width.equalTo(imageView)
            make.top.equalTo(albumLabel.snp.bottom).offset(1)
            make.height.equalTo(16)
        }
    }
    
    func configureMyAlbumsCell(imageName: String, label: String, amount: String) {
        imageView.image = UIImage(named: imageName)
        albumLabel.text = label
        amountLabel.text = String(Int.random(in: 1...999))
    }
    
    override func prepareForReuse() {
        self.imageView.image = nil
    }
}
