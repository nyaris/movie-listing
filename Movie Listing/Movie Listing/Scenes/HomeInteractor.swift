import Foundation

protocol HomeInteracting: AnyObject {
    func fetchList()
}

final class HomeInteractor: HomeInteracting {
    let service: HomeServicing
    let presenter: HomePresenting
    
    init(presenter: HomePresenting, service: HomeServicing) {
        self.presenter = presenter
        self.service = service
    }

    func fetchList() {
        fetchMovies()
    }
}

private extension HomeInteractor {
    func fetchMovies() {
        presenter.presentStartLoading()
        service.getMovies { [weak self] result in
            guard let self else { return }

            presenter.presentStopLoading()
            switch result {
            case let .success(movies):
                presenter.presentMovies(movies.response)
            case let .failure(error):
                presenter.presentErrorView()
            }
        }
    }
}
