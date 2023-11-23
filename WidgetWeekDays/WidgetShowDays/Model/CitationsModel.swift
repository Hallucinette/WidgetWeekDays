import Foundation

struct QuoteModel: Codable {
    let quote: String
    let author: String
}

class QuoteProvider {
    static func loadQuotes() -> [QuoteModel] {
        if let path = Bundle.main.path(forResource: "quotes", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let quotes = try JSONDecoder().decode([QuoteModel].self, from: data)
                return quotes
            } catch {
                // Handle error (e.g., print an error message)
                print("Error loading quotes: \(error)")
            }
        }
        return []
    }
}
