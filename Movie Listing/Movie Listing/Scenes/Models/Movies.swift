// MARK: - Movies
struct Movies: Decodable, Equatable {
    let success: Bool
    let response: [MoviesData]
}

// MARK: - MoviesData
struct MoviesData: Decodable, Equatable {
    let title: String
    let year: Int
    let description: String
    let genre: [String]
    let poster: String
    let slug: String
}
