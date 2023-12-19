
import UIKit
import SnapKit

final class PeopleAndPlacesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - State
    
    static let identifier = "PeopleAndPlacesCell"
    
    // MARK: - UIElements & Outlets
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.shouldRasterize = true
        imageView.layer.rasterizationScale = UIScreen.main.scale
        return imageView
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
        //stack.spacing = 90
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
        addSubview(imageView)
        addSubview(bottomStack)
        bottomStack.addArrangedSubview(albumLabel)
        bottomStack.addArrangedSubview(amountLabel)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.height.equalTo(145)
            make.width.equalTo(145)
        }
        
        bottomStack.snp.makeConstraints { make in
            make.width.equalTo(45)
        }
    }
    
    func configurePeopleAndPlacesCell(imageName: String, label: String, amount: Int) {
        imageView.image = UIImage(named: imageName)
        albumLabel.text = label
        amountLabel.text = String(Int.random(in: 0...999))
        
    }
}
