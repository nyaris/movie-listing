@testable import Movie_Listing
import XCTest

final class HomeDisplayingSpy: HomeDisplaying {
    enum Message: Equatable {
        case startLoading
        case stopLoading
        case displayMovies(_ datas: [MoviesData])
        case displayErrorView
    }

    private(set) var messages = [Message]()

    func startLoading() {
        messages.append(.startLoading)
    }

    func stopLoading() {
        messages.append(.stopLoading)
    }

    func displayMovies(_ datas: [MoviesData]) {
        messages.append(.displayMovies(datas))
    }

    func displayErrorView() {
        messages.append(.displayErrorView)
    }
}

final class HomePresenterTests: XCTestCase {
    private var presenter: HomePresenter?
    private var viewControllerSpy: HomeDisplayingSpy?

    override func setUp() {
        super.setUp()
        viewControllerSpy = HomeDisplayingSpy()
        presenter = HomePresenter()
        presenter?.viewController = viewControllerSpy
    }

    override func tearDown() {
        presenter = nil
        viewControllerSpy = nil
        super.tearDown()
    }

    func testPresentStartLoading_ShouldStartLoading() {
        presenter?.presentStartLoading()

        XCTAssertEqual(viewControllerSpy?.messages, [.startLoading])
    }

    func testPresentStopLoading_ShouldStopLoading() {
        presenter?.presentStopLoading()

        XCTAssertEqual(viewControllerSpy?.messages, [.stopLoading])
    }

    func testPresentMovies_ShouldDisplayMovies() {
        let datas: [MoviesData] = [.init(title: "", year: 2024, description: "", genre: [], poster: "", slug: "")]
        presenter?.presentMovies(datas)

        XCTAssertEqual(viewControllerSpy?.messages, [.displayMovies(datas)])
    }

    func testPresentErrorView_ShouldDisplayErroView() {
        presenter?.presentErrorView()

        XCTAssertEqual(viewControllerSpy?.messages, [.displayErrorView])
    }
}
