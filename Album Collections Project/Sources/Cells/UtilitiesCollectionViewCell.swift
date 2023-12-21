
import UIKit
import SnapKit

final class UtilitiesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - State
    
    static let identifier = "UtilitiesCell"
    
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
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var itemAmount: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
//        setupHierarchy()
//        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup, Layout & Configuration
    
    //    private func setupHierarchy() {
    //        [itemIcon, itemLabel, itemAmount].forEach {
    //            addSubview($0)
    //        }
    //    }
    //
    //    private func setupLayout() {
    //        itemIcon.snp.makeConstraints { make in
    //            make.left.equalTo(contentView).offset(20)
    //        }
    //
    //        itemLabel.snp.makeConstraints { make in
    //            make.centerY.equalTo(contentView)
    //            make.left.equalTo(itemIcon).offset(5)
    //        }
    //
    //        itemAmount.snp.makeConstraints { make in
    //            make.centerY.equalTo(contentView)
    //            make.right.equalTo(contentView).offset(-20)
    //        }
    //
    //    }
    //    
    
    func configureUtilitiesCell(imageName: String, label: String, amount: String) {
        itemIcon.image = UIImage(named: imageName)
        itemLabel.text = label
        itemAmount.text = String(Int.random(in: 1...999))
    }
    
//    override func prepareForReuse() {
//        self.itemIcon.image = nil
//    }
}
