
<br />
<p align="center">
  <h3 align="center">EvOpt</h3>
  <p align="center">
    experiments on evolution of behavior (options).
    <br />
    <br />
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

- [Table of Contents](#table-of-contents)
- [EvOpt](#evopt)
  - [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
- [Installation](#installation)
- [License](#license)


<!-- ABOUT THE PROJECT -->
## EvOpt

Experiments in multiagent systems to study the genetic basis of behaviors.

### Built With
* [sferes2](https://github.com/sferes2/sferes2)

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites
* Install g++ >= 8.x, python >= 3.x, libboost-all-dev >= 1.35, tbb and eigen.
```sh
sudo apt-get install libboost-dev libboost-test-dev libboost-filesystem-dev libboost-program-options-dev libboost-graph-parallel-dev python g++ libtbb-dev libeigen3-dev python-simplejson libgoogle-perftools-dev
```

## Installation
1. Clone the repo
```sh
git clone --recursive https://github.com/gaurav-dixitv/evopt
```
2. clean objects and binaries
```sh
./clean_waf.sh
```
3. compile all experiments
```sh
./compile_waf.sh
```
4. run an experiment from /libs/sferes2/build/exp/<exp_name>
```sh
./libs/sferes2/build/exp/rovers/rovers
```
TODO symlink to evopt/build/exp
<!-- LICENSE -->
## License

Distributed under the GPLv3 License. See `LICENSE` for more information.