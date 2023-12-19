
import UIKit
import SnapKit

class AlbumsHeaderView: UICollectionReusableView {
    
    // MARK: - State
    
    static let identifier = "HeaderView"
    
    // MARK: - Outlets
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup & Layout
    
    private func setupHierarchy() {
        addSubview(headerLabel)
    }
    
    private func setupLayout() {
        headerLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.height.equalTo(80)
        }
    }
    
    func configureHeader(categoryName: String) {
        headerLabel.text = categoryName
    }
}
