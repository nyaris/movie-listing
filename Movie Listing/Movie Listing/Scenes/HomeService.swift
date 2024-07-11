import Foundation

protocol HomeServicing: AnyObject {
    func getMovies(completion: @escaping (Result<Movies, Error>) -> Void)
}

final class HomeService: HomeServicing {
    let network: NetworkProtocol

    init(network: NetworkProtocol = NetworkManager()) {
        self.network = network
    }

    func getMovies(completion: @escaping (Result<Movies, Error>) -> Void) {
        let request = HomeRequest.getMovies()
        network.execute(with: request) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
