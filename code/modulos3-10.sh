#  instalacion de gnu radio
sudo apt install -y gnuradio gnuradio-dev

# instalacion de dependencias
sudo dnf install -y git cmake gcc-c++ make python3 python3-pip \
                   python3-numpy python3-mako python3-scipy \
                   fftw-devel boost-devel gmp-devel gsl-devel swig \
                   pkgconf-pkg-config volk gnuradio gnuradio-devel

# instalacion soapysdr
git clone --recursive https://github.com/pothosware/SoapySDR.git
cd SoapySDR
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
sudo ldconfig

# instalacion soapysdr hackrf
git clone --recursive https://github.com/pothosware/SoapyHackRF.git
cd SoapyHackRF
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
sudo ldconfig

# verificacion de lectura hackrf
SoapySDRUtil --find

# instalacion de gr-osmosdr
# instalacion de dependencias
sudo dnf install -y spdlog spdlog-devel

git clone https://github.com/pybind/pybind11.git
cd pybind11
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install

# gr-osmosdr
git clone --recursive https://github.com/osmocom/gr-osmosdr.git
cd gr-osmosdr
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
sudo ldconfig

