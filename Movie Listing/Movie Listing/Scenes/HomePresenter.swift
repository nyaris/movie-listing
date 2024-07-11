protocol HomePresenting: AnyObject {
    func presentStartLoading()
    func presentStopLoading()
    func presentMovies(_ datas: [MoviesData])
    func presentErrorView()
}

final class HomePresenter: HomePresenting {
    weak var viewController: HomeDisplaying?

    func presentStartLoading() {
        viewController?.startLoading()
    }
    
    func presentStopLoading() {
        viewController?.stopLoading()
    }

    func presentMovies(_ datas: [MoviesData]) {
        viewController?.displayMovies(datas)
    }
    
    func presentErrorView() {
        viewController?.displayErrorView()
    }
}
