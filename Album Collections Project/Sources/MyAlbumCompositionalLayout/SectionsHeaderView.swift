
import UIKit
import SnapKit

class SectionsHeaderView: UICollectionReusableView {
    
    // MARK: - State
    
    static let identifier = "HeaderView"
    
    // MARK: - Outlets
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 23, weight: .heavy)
        label.textColor = .black
        return label
    }()
    
    private lazy var margin: UIView = {
        let offset = UIView()
        offset.backgroundColor = .systemGray5
        offset.layer.cornerRadius = 20
        return offset
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
        [headerLabel, margin].forEach {
            addSubview($0)
        }
    }
    
    private func setupLayout() {
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(25)
        }
        
        margin.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(5)
            make.left.equalTo(headerLabel)
            make.height.equalTo(1)
            make.width.equalToSuperview().offset(10)
        }
    }
    
    func configureHeader(categoryName: String) {
        headerLabel.text = categoryName
    }
}
