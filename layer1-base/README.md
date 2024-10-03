# Layer 1: Docker Base Image

This directory contains the Dockerfile and related configurations for the base Docker image of our bioinformatics pipeline system. This image provides a consistent environment with Nix pre-installed, serving as the foundation for our reproducible workflows.


## Docker Setup Instructions

  1. Ensure you have Docker installed on your system. If not, follow the [official Docker installation guide](https://docs.docker.com/get-docker/).

  2. Clone this repository:

	git clone https://github.com/SiddharthKrishna1403/bionix-pipeline.git

  3. Navigate to the `layer1-base` directory:

	cd layer1-base


## Building the Docker Image

To build the Docker image:

  1. From the `layer1-base` directory, run:

	docker-build -t bioinfo-base:latest


  2. This process may take several minutes as it installs Nix and sets up the base environment.


## Running the Docker Image

To run a container using the built image:

  1. Execute the following command:
	
	docker run -it --rm bioinfo-base:latest

  
2. This will start an interactive shell in the container. You can now explore the Nix environment and run basic commands.


## Extending the Base Image

To extend this base image for your specific needs:

  1. Create a new Dockerfile that uses this image as a base:
	
	```dockerfile
	FROM bioinfo-base:latest

	# Add your custom installations and configurations here
	RUN nix-env -iA nixpkgs.your-package-name

	# Set up your work directory, copy files, etc.
	WORKDIR /your-work-directory
	COPY your-files .

	# Set your entrypoint or default command
	CMD ["your-command"]

	```

  2. Build your extended image
	docker build -t your-extended-image:tag -f YourDockerfile .

Remember to update the Nix flake (flake.nix) in the project root if you're adding new dependencies or changing the environment significantly.

## Troubleshooting

If you encounter issues with Nix in the container, ensure that the Nix installation process completed successfully during the image build.
For problems with specific packages, check the Nix expression in flake.nix and ensure all dependencies are correctly specified.

## Contributing
 
If you make improvements to this image, please update this README and submit a pull request with your changes.
For more information on the overall project structure and contribution guidelines, please refer to the main project README and CONTRIBUTING.md file
	
