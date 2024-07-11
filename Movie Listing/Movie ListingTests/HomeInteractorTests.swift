@testable import Movie_Listing
import XCTest

final class HomeServicingSpy: HomeServicing {
    var result: Result<Movies, Error>?

    func getMovies(completion: @escaping (Result<Movies, Error>) -> Void) {
        guard let result else {
            XCTFail("Expected result not implemented")
            return
        }
        completion(result)
    }
}

final class HomePresentingSpy: HomePresenting {
    enum Message: Equatable {
        case presentStartLoading
        case presentStopLoading
        case presentMovies(_ datas: [MoviesData])
        case presentErrorView
    }

    private(set) var messages = [Message]()

    func presentStartLoading() {
        messages.append(.presentStartLoading)
    }

    func presentStopLoading() {
        messages.append(.presentStopLoading)
    }

    func presentMovies(_ datas: [MoviesData]) {
        messages.append(.presentMovies(datas))
    }

    func presentErrorView() {
        messages.append(.presentErrorView)
    }
}

final class HomeInteractorTests: XCTestCase {
    private var interactor: HomeInteractor?
    private var presenterSpy: HomePresentingSpy?
    private var serviceSpy: HomeServicingSpy?

    override func setUp() {
        super.setUp()
        presenterSpy = HomePresentingSpy()
        serviceSpy = HomeServicingSpy()
        interactor = HomeInteractor(presenter: presenterSpy!, service: serviceSpy!)
    }

    override func tearDown() {
        interactor = nil
        presenterSpy = nil
        serviceSpy = nil
        super.tearDown()
    }

    func testFetchList_WhenResultIsSuccess_ShouldPresentMovies() {
        let movies = Movies(success: true, response: [
            MoviesData(
                title: "title",
                year: 2024,
                description: "description",
                genre: [],
                poster: "poster",
                slug: "slug"
            )
        ])
        serviceSpy?.result = .success(movies)
        interactor?.fetchList()

        XCTAssertEqual(presenterSpy?.messages, [.presentStartLoading, .presentStopLoading, .presentMovies(movies.response)])
    }

    func testFetchList_WhenResultIsFailure_ShouldPresentErrorView() {
        serviceSpy?.result = .failure(NetworkError.noData)
        interactor?.fetchList()

        XCTAssertEqual(presenterSpy?.messages, [.presentStartLoading, .presentStopLoading, .presentErrorView])
    }
}
