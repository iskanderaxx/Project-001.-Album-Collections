
import UIKit
import SnapKit

final class MyAlbumsViewController: UIViewController {
    
    // MARK: - UIElements & Outlets
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        //let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.bounces = true
        collectionView.register(MyAlbumCompositionalLayoutCell.self,
                                forCellWithReuseIdentifier: MyAlbumCompositionalLayoutCell.identifier)
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup & Layout
    
    private func setupNavigation() {
        title = "Albums"
        self.navigationItem.setLeftBarButton(UIBarButtonItem(
            title: nil,
            image: UIImage(systemName: "plus"),
            primaryAction: UIAction(handler: {_ in self.dismiss(animated: true)}),
            menu: nil), animated: true)

        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        [collectionView].forEach { view.addSubview($0) }
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                  heightDimension: .fractionalHeight(0.5))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 4),
                                                   heightDimension: .fractionalHeight(1 / 4 * 5))
            let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: layoutItem, count: 4)
            layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)
            
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            // Эти отступы бужут отвечать за отступы секции слева и справа в процессе скролла
            layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            layoutSection.orthogonalScrollingBehavior = .groupPaging
            return layoutSection
        }
    }
}

