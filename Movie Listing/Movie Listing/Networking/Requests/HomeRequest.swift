struct HomeRequest: Request {
    var method: HTTPMethod
    var endpoint: String

    static func getSports() -> Self {
        .init(
            method: .get,
            endpoint: "https://api.andrespecht.dev/movies"
        )
    }
}
