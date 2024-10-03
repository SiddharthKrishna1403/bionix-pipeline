# Contributing Guidelines


## Branching Strategy

This project uses a modified GitFlow branching strategy:

- `main`: Production-ready code
- `develop`: Integration branch for features
- `layer1-base`: Docker base image development
- `layer2-environments`: Nix environments development
- `layer3-nextflow`: Nextflow pipeline development



### Feature Development

1. Create a new branch from the appropriate layer branch:
	
	git checkout -b feature/your-feature-name layer1-base

2. Develop your feature
3. Create a pull request to merge into the layer branch



### Bugfix Process

1. Create a new branch from the appropriate layer branch:

	git checkout -b bugfix/issue-description layer2-environments

2. Fix the bug
3. Create a pull request to merge into the layer branch



### Integration Process

1. Regularly merge layer branches into `develop`:

	git checkout develop
	git merge layer1-base
	git merge layer2-environments
	git merge layer3-nextflow

2. Resolve any conflicts during integration



### Release Process

1. Create a release branch from `develop`:

	git checkout -b release/v1.0.0 develop

2. Perform final testing and bug fixes
3. Merge into `main` and tag the release
4. Merge back into `develop`

Please ensure all code is well-documented and tested before submitting a pull request.
