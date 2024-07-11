import UIKit

protocol ErrorViewDelegate: AnyObject {
    func didTapTryAgain()
}

final class ErrorView: UIView {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "error-image")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ops, algo deu errado no nosso sistema"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tryAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tentar novamente", for: .normal)
        button.addTarget(self, action: #selector(didTapTryAgainButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    weak var delegate: ErrorViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    func didTapTryAgainButton() {
        delegate?.didTapTryAgain()
    }
}

extension ErrorView: ViewConfiguration {
    func buildHierarchy() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(tryAgainButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 250),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            tryAgainButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            tryAgainButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            tryAgainButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            tryAgainButton.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func configureViews() {
        backgroundColor = .clear
    }
}
