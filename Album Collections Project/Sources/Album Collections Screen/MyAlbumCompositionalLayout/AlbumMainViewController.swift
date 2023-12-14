/*
import UIKit
import SnapKit

final class MyAlbumsViewController: UIViewController {
    
    // MARK: - UIElements & Outlets
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        //let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.bounces = true
        collectionView.register(MyAlbumsFlowLayoutCell.self,
                                forCellWithReuseIdentifier: MyAlbumsFlowLayoutCell.identifier)
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
        navigationItem.setLeftBarButton(UIBarButtonItem(
            title: nil,
            image: UIImage(systemName: "plus"),
            primaryAction: UIAction(handler: {_ in self.dismiss(animated: true)}),
            menu: nil), animated: true)

        navigationController?.navigationBar.prefersLargeTitles = true
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
        return UICollectionViewCompositionalLayout { sectionIndex, in
        }
    }
} */
