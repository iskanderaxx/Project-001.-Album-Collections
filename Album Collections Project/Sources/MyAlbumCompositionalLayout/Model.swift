
import Foundation

struct ListProperties {
    let image: String
    let title: String
    let amount: String
}

enum ListSection {
    case myAlbums([ListProperties])
    case sharedAlbums([ListProperties])
    case mediaTypes([ListProperties])
    case utilities([ListProperties])
    
    var items: [ListProperties] {
        switch self {
        case .myAlbums(let items),
                .sharedAlbums(let items),
                .mediaTypes(let items),
                .utilities(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var sectionTitle: String {
        switch self {
        case .myAlbums(_):
            return "My Albums"
        case .sharedAlbums(_):
            return "Shared Albums"
        case .mediaTypes(_):
            return "Media Types"
        case .utilities(_):
            return "Utilities"
        }
    }
}

struct Model {
    
    static let shared = Model()
    
    private let myAlbums: ListSection = {
        .myAlbums([.init(image: "photo1", title: "Recents", amount: ""),
                   .init(image: "photo2", title: "Travelling", amount: ""),
                   .init(image: "photo3", title: "Favorites", amount: ""),
                   .init(image: "photo4", title: "Serbia", amount: ""),
                   
                   .init(image: "photo5", title: "Mountains", amount: ""),
                   .init(image: "photo6", title: "Rivers", amount: ""),
                   .init(image: "photo7", title: "Rocks", amount: ""),
                   .init(image: "photo8", title: "Trees", amount: "")])
    }()
    
    private let sharedAlbums: ListSection = {
        .sharedAlbums([.init(image: "photo9", title: "People", amount: ""),
                       .init(image: "photo10", title: "Places", amount: "")])
    }()
    
    private let mediaTypes: ListSection = {
        .mediaTypes([.init(image: "video", title: "Video", amount: ""),
                     .init(image: "person.crop.square", title: "Selfie", amount: ""),
                     .init(image: "circle.dotted.circle", title: "Live Photos", amount: ""),
                     .init(image: "cube", title: "Portraits", amount: ""),
                     
                     .init(image: "pano", title: "Panoramas", amount: ""),
                     .init(image: "square.on.square.intersection.dashed", title: "Series", amount: ""),
                     .init(image: "camera.viewfinder", title: "Screetshots", amount: ""),
                     .init(image: "smallcircle.filled.circle", title: "Screen recordings", amount: "")])
    }()
    
    private let utilities: ListSection = {
        .utilities([.init(image: "square.and.arrow.down", title: "Imported", amount: ""),
                    .init(image: "eye.slash", title: "Hidden", amount: ""),
                    .init(image: "trash", title: "Recently Deleted", amount: "")])
    }()
    
    var pageData: [ListSection] {
        [myAlbums, sharedAlbums, mediaTypes, utilities]
    }
}
