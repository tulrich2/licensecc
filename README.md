# Licensecc

*Copy protection, licensing library and license generator for Mac and Linux.*

Protect the software you develop from unauthorized copies, limit the usage in time, to a specific set of 
machines, or prevent the usage in  virtualized environments. It is an open source license manager that helps to keep your 
software closed. Among other features if it runs on a "real hardware" it can generate a signature of that hardware and report if the signature doesn't match.


## License
The project is donated to the community. It comes with freedom of use for everyone, and it always will be. 
It has a [BSD 3 clauses](https://opensource.org/licenses/BSD-3-Clause) licensing schema, that allows free modification and use in commercial software. 


## Project Structure
The software is made by 4 main sub-components:
-   a C++ library with a nice C api, `licensecc` with minimal (or no) external dependencies (the part you have to integrate in your software) that is the project you're currently in.
-   a license debugger `lcc-inspector` to be sent to the final customer when there are licensing problems or for calculating the pc hash before issuing the license.
-   a license generator (github project [lcc-license-generator](https://github.com/tulrich2/lcc-license-generator)) `lccgen` for customizing the library and generate the licenses.
-   Usage [examples](https://github.com/open-license-manager/examples) to simplify the integration in your project.
 

## How to build

1. Check out the repository including the submodules:
```bash
git clone --recursive https://github.com/tulrich2/licensecc.git
```

2. From within the repository root directory, configure the `CMake` project:
```bash
cmake -S . -B build
```

You can also specify the name of the software you want to generate and validate licenses for:
```bash
cmake -S . -B build -DLCC_PROJECT_NAME=<software_name>
```

3. Build the license generator and the C++ library
```bash
cmake --build build --target environment lccgen licensecc_static -- -j <num_threads>
```
