
import UIKit
import SnapKit

final class MyAlbumCompositionalLayoutCell: UICollectionViewCell {
    // MARK: - State
    
    static var identifier = "MyAlbumsCell"
    
    // MARK: - UIElements & Outlets
    
    lazy var image: UIImageView = {
        let image  = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.shouldRasterize = true
        image.layer.rasterizationScale = UIScreen.main.scale
        return image
    }()
    
    lazy var albumLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let bottomStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 90
        return stack
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup & Layout
    
    private func setupHierarchy() {
        addSubview(image)
        addSubview(bottomStack)
        bottomStack.addArrangedSubview(amountLabel)
        bottomStack.addArrangedSubview(albumLabel)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
        
        bottomStack.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        self.image.image = nil
    }
}
