
import Foundation

struct ListProperties {
    let image: String
    let title: String
    let amount: Int
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
        .myAlbums([.init(image: "photo1", title: "Recents", amount: 999),
                   .init(image: "photo2", title: "Travelling", amount: 56),
                   .init(image: "photo3", title: "Favorites", amount: 567),
                   .init(image: "photo4", title: "Serbia", amount: 213),
                   
                   .init(image: "photo5", title: "Mountains", amount: 987),
                   .init(image: "photo6", title: "Rivers", amount: 8),
                   .init(image: "photo7", title: "Rocks", amount: 56),
                   .init(image: "photo8", title: "Trees", amount: 14)])
    }()
    
    private let sharedAlbums: ListSection = {
        .sharedAlbums([.init(image: "photo9", title: "People", amount: 11),
                       .init(image: "photo10", title: "Places", amount: 678)])
    }()
    
    private let mediaTypes: ListSection = {
        .mediaTypes([.init(image: "", title: "Video", amount: 400),
                     .init(image: "", title: "Selfie", amount: 121),
                     .init(image: "", title: "Live Photos Photo", amount: 81),
                     .init(image: "", title: "Portraits", amount: 253),
                     
                     .init(image: "", title: "Panoramas", amount: 3),
                     .init(image: "", title: "Series", amount: 16),
                     .init(image: "", title: "Screetshots", amount: 214),
                     .init(image: "", title: "Screen recordings", amount: 6)])
    }()
    
    private let utilities: ListSection = {
        .utilities([.init(image: "", title: "Imported", amount: 235),
                    .init(image: "", title: "Hidden", amount: 11),
                    .init(image: "", title: "Recently Deleted", amount: 78)])
    }()
    
    var pageData: [ListSection] {
        [myAlbums, sharedAlbums, mediaTypes, utilities]
    }
}
 
/*
struct Model {
    static var images: [String] = [
        "photo1", "photo2", "photo3", "photo4", "photo5", "photo6", "photo7", "photo8", "photo9", "photo10", "photo11", "photo12", "photo13", "photo14", "photo15", "photo16", "photo17", "photo18", "photo19", "photo20"
    ]
}

struct Model: Hashable {
    var title: String?
    var description: String?
    var image: String?
    var numberOfItem: Int?
}

extension Model {
    static var modelsArray = [
        [Model(title: nil, description: "Recents", image: "photo1", numberOfItem: 483),
         Model(title: nil, description: "Travelling", image: "photo2", numberOfItem: 9),
         Model(title: nil, description: "Favorites", image: "photo3", numberOfItem: 29),
         Model(title: nil, description: "Serbia", image: "photo4", numberOfItem: 10),
         
         Model(title: nil, description: "Mountains", image: "photo5", numberOfItem: 14),
         Model(title: nil, description: "Rives", image: "photo6", numberOfItem: 687),
         Model(title: nil, description: "Nature", image: "photo7", numberOfItem: 98),
         Model(title: nil, description: "Trees", image: "photo8", numberOfItem: 336)
        ],
        
        [Model(title: nil, description: "People", image: "photo9", numberOfItem: 15),
         Model(title: nil, description: "Places", image: "photo10", numberOfItem: 483),
        ],
        
        [Model(title: "Video", image: nil),
         Model(title: "Video", image: nil),
         Model(title: "Video", image: nil),
         Model(title: "Video", image: nil),
         Model(title: "Video", image: nil),
         Model(title: "Video", image: nil),
         Model(title: "Video", image: nil),
         Model(title: "Video", image: nil)
        ],
        
        [Model(title: "Video", image: nil),
         Model(title: "Video", image: nil),
         Model(title: "Video", image: nil)
        ]
    ]
} */
