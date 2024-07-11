import UIKit

final class HomeViewCell: UITableViewCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        image.backgroundColor = .white
    }

    func setup(imageUrl: String, titleText: String) {
        title.text = titleText

        guard let imageUrl = URL(string: imageUrl) else { return }
        image.load(url: imageUrl)
    }
}

extension HomeViewCell: ViewConfiguration {
    func buildHierarchy() {
        contentView.addSubview(containerView)

        containerView.addSubview(title)
        containerView.addSubview(image)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            image.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            image.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 8),
            image.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            image.heightAnchor.constraint(equalToConstant: 140),
            image.widthAnchor.constraint(equalToConstant: 100),

            title.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            title.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    func configureViews() {
        backgroundColor = .clear
        selectionStyle = .none
    }
}
