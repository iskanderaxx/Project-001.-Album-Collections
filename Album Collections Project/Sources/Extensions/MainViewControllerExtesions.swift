
import UIKit

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.section] {
        //  Тут могли быть индексы 0-3 и т.п., как в лекции, но у нас есть свои обозначения в Model, потому ставим их
        case .myAlbums(let myAlbum):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumCollectionViewCell.identifier,
                                                                for: indexPath) as? MyAlbumCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureMyAlbumsCell(imageName: myAlbum[indexPath.row].image,
                                       label: myAlbum[indexPath.row].title,
                                       amount: myAlbum[indexPath.row].amount)
            return cell
        
        case .sharedAlbums(let sharedAlbum):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleAndPlacesCollectionViewCell.identifier,
                                                                for: indexPath) as? PeopleAndPlacesCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configurePeopleAndPlacesCell(imageName: sharedAlbum[indexPath.row].image,
                                              label: sharedAlbum[indexPath.row].title,
                                              amount: sharedAlbum[indexPath.row].amount)
            return cell
            
        case .mediaTypes(let mediaType):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaFileTypesCollectionViewCell.identifier,
                                                                for: indexPath) as? MediaFileTypesCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureMediaFileTypesCell(imageName: mediaType[indexPath.row].image,
                                             label: mediaType[indexPath.row].title,
                                             amount: mediaType[indexPath.row].amount)
            return cell
            
        case .utilities(let utility):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UtilitiesCollectionViewCell.identifier,
                                                                for: indexPath) as? UtilitiesCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureUtilitiesCell(imageName: utility[indexPath.row].image,
                                             label: utility[indexPath.row].title,
                                             amount: utility[indexPath.row].amount)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         
         switch kind {
         case UICollectionView.elementKindSectionHeader:
             guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                          withReuseIdentifier: AlbumsHeaderView.identifier,
                                                                          for: indexPath) as? AlbumsHeaderView
             else {
                 return UICollectionReusableView()
             }
             header.configureHeader(categoryName: sections[indexPath.section].sectionTitle)
             return header
         default:
             return UICollectionReusableView()
         }
     }
    
    func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
}

        
/*
        switch screenSections[indexPath.section] {
            
        case .myAlbums(let myAlbums):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumLayoutCell.identifier,
                                                                for: indexPath) as? MyAlbumLayoutCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: myAlbums[indexPath.row].image)
            //cell.image.image = UIImage(named: Model.images[indexPath.item])
            //item.amountLabel.text = String(Int.random(in: 0...999))
            return cell
            
        case .sharedAlbums(let sharedAlbums):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleAndPlacesViewCell.identifier,
                                                                for: indexPath) as? PeopleAndPlacesViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: sharedAlbums[indexPath.row].image)
            //cell.image.image = UIImage(named: Model.images[indexPath.item])
            //item.amountLabel.text = String(Int.random(in: 0...999))
            return cell
            
        case .mediaTypes(let mediaTypes):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaFileTypesViewCell.identifier,
                                                                for: indexPath) as? MediaFileTypesViewCell
            else {
                return UICollectionViewCell()
            }
            //cell.configureCell(imageName: mediaTypes[indexPath.row].image)
            //cell.image.image = UIImage(named: Model.images[indexPath.item])
            //item.amountLabel.text = String(Int.random(in: 0...999))
            return cell
            
        case .utilities(let utilities):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OtherTypesViewCell.identifier,
                                                                for: indexPath) as? OtherTypesViewCell
            else {
                return UICollectionViewCell()
            }
            //cell.configureCell(imageName: mediaTypes[indexPath.row].image)
            //cell.image.image = UIImage(named: Model.images[indexPath.item])
            //item.amountLabel.text = String(Int.random(in: 0...999))
            return cell
        }
*/
