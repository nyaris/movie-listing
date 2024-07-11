import UIKit

protocol HomeDisplaying: AnyObject {
    func startLoading()
    func stopLoading()
    func displayMovies(_ datas: [MoviesData])
    func displayErrorView()
}

class HomeViewController: UIViewController {
    let interactor: HomeInteracting
    private var datas = [MoviesData]()
    private let homeCellId = "HomeViewCell"

    private lazy var loadingView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .systemGreen
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: homeCellId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var errorView: UIView = {
        let errorView = ErrorView()
        errorView.delegate = self
        errorView.translatesAutoresizingMaskIntoConstraints = false
        return errorView
    }()
    
    init(interactor: HomeInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
        interactor.fetchList()
    }
}

// MARK: - ViewConfiguration
extension HomeViewController: ViewConfiguration {
    func buildHierarchy() {
        view.addSubview(tableView)
        view.addSubview(loadingView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func configureViews() {
        navigationItem.title = Strings.homeTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    

        view.backgroundColor = Color.charcoal
    }
}

// MARK: - HomeDisplaying
extension HomeViewController: HomeDisplaying {
    func startLoading() {
        loadingView.startAnimating()
    }

    func stopLoading() {
        loadingView.stopAnimating()
    }

    func displayMovies(_ datas: [MoviesData]) {
        self.datas = datas
        tableView.reloadData()
    }
    
    func displayErrorView() {
        view.addSubview(errorView)

        NSLayoutConstraint.activate([
            errorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: homeCellId, for: indexPath) as? HomeViewCell else {
            return UITableViewCell()
        }

        let movie = datas[indexPath.row]
        cell.setup(imageUrl: movie.poster, titleText: movie.title + " (\(movie.year))")

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
}

// MARK: - ErrorViewDelegate
extension HomeViewController: ErrorViewDelegate {
    func didTapTryAgain() {
        errorView.removeFromSuperview()
        interactor.fetchList()
    }
}
