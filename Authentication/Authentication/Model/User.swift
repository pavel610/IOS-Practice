
import Foundation
import UIKit

struct User {
    let login: String
    let password: String
    let fullName: String
    let birthDate: String
    let contactInfo: String
    let bio: String
    let avatar: UIImage
    var likedBooks = [Book]()
}
