
import UIKit
import SnapKit

final class MediaFileTypesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - State
    
    static let identifier = "MediaFileTypesCell"
    
    // MARK: - UIElements & Outlets
    
    private lazy var itemIcon: UIImageView = {
        let icon  = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .systemBlue
        icon.clipsToBounds = true
        return icon
    }()
    
    lazy var itemLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    lazy var itemAmount: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var disclosureIndicatorIcon: UIImageView = {
        let icon  = UIImageView()
        icon.image = UIImage(named: "chevron.right")
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .systemGray
        icon.clipsToBounds = true
        return icon
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
        [itemIcon, itemLabel, itemAmount, disclosureIndicatorIcon].forEach {
            addSubview($0)
        }
    }
    
    private func setupLayout() {
        itemIcon.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView)
            make.height.equalTo(23)
            make.width.equalTo(23)
        }
        
        itemLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(itemIcon).offset(40)
        }
        
        itemAmount.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(itemIcon).offset(295)
        }
        
        disclosureIndicatorIcon.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(itemAmount).offset(38)
            make.height.equalTo(12)
            make.width.equalTo(12)
        }
    }
    
    func configureMediaFileTypesCell(imageName: String, label: String, amount: String) {
        itemIcon.image = UIImage(named: imageName)
        itemLabel.text = label
        itemAmount.text = String(Int.random(in: 1...999))
    }
    
    override func prepareForReuse() {
        self.itemIcon.image = nil
    }
}
