
import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    // MARK: - State
    
    let sections = Model.shared.pageData
    
    // MARK: - UIElements & Outlets
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyAlbumCollectionViewCell.self, 
                                forCellWithReuseIdentifier: MyAlbumCollectionViewCell.identifier)
        collectionView.register(PeopleAndPlacesCollectionViewCell.self, 
                                forCellWithReuseIdentifier: PeopleAndPlacesCollectionViewCell.identifier)
        collectionView.register(MediaFileTypesCollectionViewCell.self, 
                                forCellWithReuseIdentifier: MediaFileTypesCollectionViewCell.identifier)
        collectionView.register(UtilitiesCollectionViewCell.self, 
                                forCellWithReuseIdentifier: UtilitiesCollectionViewCell.identifier)
        collectionView.register(SectionsHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionsHeaderView.identifier)
        collectionView.bounces = true
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    
    // MARK: - Setup & Layout
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .myAlbums(_):
                return self.createMyAlbumsSection()
            case .sharedAlbums(_):
                return self.createPeopleAndPlacesSection()
            case .mediaTypes(_):
                return self.createMediaTypesSection()
            case .utilities(_):
                return self.createUtilitiesSection()
            }
        }
    }
    
    private func createMyAlbumsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.46),
                                               heightDimension: .fractionalWidth(0.53 * 2))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                             heightDimension: .estimated(25))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 10, bottom: 25, trailing: 10)
        layoutSection.orthogonalScrollingBehavior = .groupPaging
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
        
        return layoutSection
    }
    
    private func createPeopleAndPlacesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95),
                                               heightDimension: .fractionalHeight(0.33))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: layoutItem, count: 2)
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                             heightDimension: .estimated(25))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 10, bottom: 25, trailing: 10)
        layoutSection.orthogonalScrollingBehavior = .groupPaging
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
        
        return layoutSection
    }
    
    
    
    private func createMediaTypesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(0.33))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95),
                                               heightDimension: .fractionalWidth(0.55))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
//        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
//                                                             heightDimension: .estimated(80))
//        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//            layoutSize: layoutSectionHeaderSize,
//            elementKind: UICollectionView.elementKindSectionHeader,
//            alignment: .top)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        //layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 10, bottom: 50, trailing: 10)
        layoutSection.orthogonalScrollingBehavior = .none
//        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

        return layoutSection
    }
    
    private func createUtilitiesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(0.33))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95),
                                               heightDimension: .fractionalWidth(0.55))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
//        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
//                                                             heightDimension: .estimated(80))
//        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//            layoutSize: layoutSectionHeaderSize,
//            elementKind: UICollectionView.elementKindSectionHeader,
//            alignment: .top)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        //layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 10, bottom: 50, trailing: 10)
        layoutSection.orthogonalScrollingBehavior = .none
//        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

        return layoutSection
    }
}
