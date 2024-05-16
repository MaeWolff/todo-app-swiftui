import Foundation

struct StorageKeys {
    static let todos = "todos"
}

class StorageManager {
    static func save<T: Encodable>(object: T, forKey key: String) {
        do {
            let encoded = try JSONEncoder().encode(object)
            UserDefaults.standard.set(encoded, forKey: key)
        } catch {
            print("Error encoding object: \(error)")
        }
    }
    
    static func load<T: Decodable>(forKey key: String, as type: T.Type) -> T? {
        if let data = UserDefaults.standard.object(forKey: key) as? Data {
            do {
                let decoded = try JSONDecoder().decode(type, from: data)
                return decoded
            } catch {
                print("Error decoding object: \(error)")
            }
        }
        return nil
    }
}
