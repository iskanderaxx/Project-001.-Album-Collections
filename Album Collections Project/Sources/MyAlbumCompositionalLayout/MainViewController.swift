
import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    // MARK: - State
    
    let sections = Model.shared.pageData
    
    // MARK: - UIElements & Outlets
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.bounces = true
        
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
        collectionView.register(AlbumsHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: AlbumsHeaderView.identifier)
        collectionView.collectionViewLayout = createLayout()
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup & Layout
    
    private func setupNavigationBar() {
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.setLeftBarButton(UIBarButtonItem(title: nil,
                                                        image: UIImage(systemName: "plus"),
                                                        primaryAction: UIAction(handler: {_ in self.dismiss(animated: true)}),
                                                        menu: nil), animated: true)
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            //make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.top.trailing.bottom.equalTo(view)
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
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     innerSpacing: CGFloat,
                                     supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
                                     contentInsets: Bool) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = innerSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
    }
    
    private func createMyAlbumsSection() -> NSCollectionLayoutSection { // ширина 2.2, высота 1.9 * 2
        
        let itemSize = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let groupSize = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1 / 1.9),
                                                                         heightDimension: .fractionalHeight(1 / 2)),
                                                       subitems: [itemSize])
        let section = createLayoutSection(group: groupSize,
                                          behavior: .groupPaging,
                                          innerSpacing: 5,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10) // или с  .init
        return  section
    }
    
    private func createPeopleAndPlacesSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let groupSize = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1 / 1.9),
                                                                         heightDimension: .fractionalHeight(1 / 2)),
                                                       subitems: [itemSize])
        let section = createLayoutSection(group: groupSize,
                                          behavior: .groupPaging,
                                          innerSpacing: 5,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10)
        return section
    }
    
    private func createMediaTypesSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let groupSize = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .absolute(45)),
                                                       subitems: [itemSize])
        groupSize.interItemSpacing = .flexible(10)
        let section = createLayoutSection(group: groupSize,
                                          behavior: .groupPaging,
                                          innerSpacing: 5,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 10, bottom: 50, trailing: 10)
        return section
    }
    
    private func createUtilitiesSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let groupSize = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .absolute(45)),
                                                       subitems: [itemSize])
        groupSize.interItemSpacing = .flexible(10)
        let section = createLayoutSection(group: groupSize,
                                          behavior: .groupPaging,
                                          innerSpacing: 5,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 10, bottom: 50, trailing: 10)
        return section
    }
}

/*  case 0:
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2), //2.2
                                               heightDimension: .fractionalHeight(1 / 2)) // 1.9 * 2
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
        //let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: layoutItem, count: 2)
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95),
                                                             heightDimension: .estimated(80))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize,
                                                                              elementKind: UICollectionView.elementKindSectionHeader,
                                                                              alignment: .top)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 5, trailing: 2.5) // gо 10
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
        layoutSection.orthogonalScrollingBehavior = .groupPaging
        
        return layoutSection
    case 1:
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2),
                                               heightDimension: .fractionalHeight(1 / 2))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
        //let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: layoutItem, count: 2)
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95),
                                                             heightDimension: .estimated(80))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize,
                                                                              elementKind: UICollectionView.elementKindSectionHeader,
                                                                              alignment: .top)
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 5, trailing: 2.5)
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
        layoutSection.orthogonalScrollingBehavior = .none
        
        return layoutSection
    case 2:
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(45))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95),
                                                             heightDimension: .estimated(80))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize,
                                                                              elementKind: UICollectionView.elementKindSectionHeader,
                                                                              alignment: .top)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 10, bottom: 50, trailing: 10)
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
        layoutSection.orthogonalScrollingBehavior = .none
        
        return layoutSection
    case 3:
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(45))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95),
                                                             heightDimension: .estimated(80))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize,
                                                                              elementKind: UICollectionView.elementKindSectionHeader,
                                                                              alignment: .top)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 10, bottom: 50, trailing: 10)
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
        layoutSection.orthogonalScrollingBehavior = .none
        
        return layoutSection
    default:
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2),
                                               heightDimension: .fractionalHeight(1 / 2))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
        //let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: layoutItem, count: 2)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 5, trailing: 2.5) // gо 10
        layoutSection.orthogonalScrollingBehavior = .groupPaging
        
        return layoutSection
    }
}
*/
