protocol ViewConfiguration {
    func buildLayout()
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewConfiguration {
    func buildLayout() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}
