# Build resource

## Build tools and Docker images

To use available Figures, you need use customized Docker images.

```bash
sudo apt install build-essential automake autoconf autoreconf auto-tools bin-utils
cd ./docker-tools
make
cd ..
```

## Build documents (LaTeX)

You can build `LaTeX` files with below command or download all as `Documents.zip` from [release](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/releases/latest) page.

```bash
latexmk -pdf -interaction=nonstopmode -cd **/*.tex
```

## Build Figures

You can build `Figures` files with below command or download all as `Figures.zip` from [release](https://github.com/UT-Network-Lab/TCP-IP-Laboratory/releases/latest) page.

```bash
cd Figures
./build-gns3p.sh
```
