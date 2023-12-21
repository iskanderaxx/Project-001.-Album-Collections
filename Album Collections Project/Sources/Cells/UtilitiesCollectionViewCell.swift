
import UIKit
import SnapKit

final class UtilitiesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - State
    
    static let identifier = "UtilitiesCell"
    
    // MARK: - UIElements & Outlets
    
    private lazy var itemIcon: UIImageView = {
        let imageView  = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var itemLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var itemAmount: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        return label
    }()
    
    private let imageContainer: UIView = {
        let container = UIView()
        return container
    }()
    
    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 1
        return stack
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
        addSubview(mainStack)
        mainStack.addArrangedSubview(itemLabel)
        mainStack.addArrangedSubview(itemAmount)
        addSubview(imageContainer)
        imageContainer.addSubview(itemIcon)
    }
    
    private func setupLayout() {
        itemIcon.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(imageContainer)
            make.center.equalTo(imageContainer)
        }
        
        imageContainer.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(40)
        }
        
        mainStack.snp.makeConstraints { make in
            make.centerY.equalTo(imageContainer)
            make.left.equalTo(imageContainer.snp.right).offset(20)
        }
    }
    
    func configureUtilitiesCell(imageName: String, label: String, amount: String) {
        itemIcon.image = UIImage(named: imageName)
        itemLabel.text = label
        itemAmount.text = String(Int.random(in: 1...999))
    }
    
    override func prepareForReuse() {
        self.itemIcon.image = nil
    }
}
