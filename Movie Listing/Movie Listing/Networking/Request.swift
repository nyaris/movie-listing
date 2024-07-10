protocol Request {
    var method: HTTPMethod { get }
    var endpoint: String { get }
}

enum HTTPMethod: String {
    case get = "GET"
}
