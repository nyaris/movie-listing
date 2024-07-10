import Foundation

enum API {
    static let baseURL = "https://618d3aa7fe09aa001744060a.mockapi.io/"
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case noData
    case decodingError(description: String)
    case requestError(description: String)
}

protocol NetworkProtocol {
    func execute<T: Decodable>(with request: Request, completion: @escaping (Result<T, Error>) -> Void)
}

final class NetworkManager: NetworkProtocol {
    let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func execute<T: Decodable>(with request: Request, completion: @escaping (Result<T, Error>) -> Void) {
        let url = URL(string: API.baseURL + request.endpoint)

        guard let url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue

        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.requestError(description: error.localizedDescription)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }

            guard let data = data else {
                return completion(.failure(NetworkError.noData))
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(NetworkError.decodingError(description: error.localizedDescription)))
            }
        }
        dataTask.resume()
    }
}
