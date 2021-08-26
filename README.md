<h1 align="center"> Dockerfiles </h1>

<div align="center">

<a> <img src="https://img.shields.io/badge/Python-3.8-blue" alt="Python:3.8" /> </a>
<a> <img src="https://img.shields.io/badge/OpenCV-4.5.3-yellowgreen" alt="OpenCV:4.5.3" /> </a>
<a> <img src="https://img.shields.io/badge/Node-14.x-blueviolet" alt="Build:CUDA | CPU" /> </a>

This repo contains a collection of dockerfiles used for Computer Vision and Machine Learning research. Dockerfiles are categorized in respective folders with their own Readme files.

</div>

## Development

[Dev](dev) dir contains dockerfiles which contains dependencies sufficient for prototyping, executing, implementing or developing common Computer Vision and Machine Learning projects in isolated reproducible containers without polluting the host machine. An example workflow is shown below:

```sh
cd project_dir
docker run --pull --rm -it -v $(pwd):/project saravanabalagi/dev:ubuntu20.04-py38-node14

# inside docker
cd /project
# for node project
yarn install
yarn run
# for python project
poetry install
source .venv/bin/activate
python run.py
```

I personally find doing the same with [Singularity](https://sylabs.io/singularity/) a lot more convenient, given it's design which attaches the home directory and the working directory and that it can be seamlessly used to execute long running processes on HPC. However, there are cases where it's harder or impossible to do some stuff with Singularity containers and/or instances. Docker comes handy for step-by-step builds taking advantage of the docker layers, unlike Singularity which builds the whole `.def` file in one shot.

## License

Please see attached [License](LICENSE)
