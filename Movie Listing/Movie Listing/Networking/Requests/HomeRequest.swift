struct HomeRequest: Request {
    var method: HTTPMethod
    var endpoint: String

    static func getMovies() -> Self {
        .init(
            method: .get,
            endpoint: "movies"
        )
    }
}
