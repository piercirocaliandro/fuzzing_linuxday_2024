# Shoutout
Thanks to [Antonio Morales wonderful tutorial!](https://github.com/antonio-morales/Fuzzing101)

# Fuzzing examples 
First, you need to [install `AFLplusplus`](https://github.com/AFLplusplus/AFLplusplus/blob/stable/docs/INSTALL.md)

```
sudo apt-get update
sudo apt-get install -y build-essential python3-dev automake cmake git flex bison libglib2.0-dev libpixman-1-dev python3-setuptools cargo libgtk-3-dev
# try to install llvm 14 and install the distro default if that fails
sudo apt-get install -y lld-14 llvm-14 llvm-14-dev clang-14 || sudo apt-get install -y lld llvm llvm-dev clang
sudo apt-get install -y gcc-$(gcc --version|head -n1|sed 's/\..*//'|sed 's/.* //')-plugin-dev libstdc++-$(gcc --version|head -n1|sed 's/\..*//'|sed 's/.* //')-dev
git clone https://github.com/AFLplusplus/AFLplusplus
cd AFLplusplus
make all -j$(nproc)
make install
```

(if you want `AFLplusplus` installed globally, you can do `sudo make install`)

# `xpdf`

## Compile, instrument and install
```
chmod +x scripts/xpdf/compile_xpdf.sh
scripts/xpdf/compile_xpdf.sh
cd $HOME
```

## Fuzz `xpdf`
```
$HOME/AFLplusplus/afl-fuzz -i $HOME/xpdf_example/pdf_examples/ -o $HOME/xpdf_example/out/ -s 123 -- $HOME/xpdf_example/install/bin/pdftotext @@ $HOME/xpdf_example/output
```

Or, if you installed `AFLplusplus` globally

```
afl-fuzz -i $HOME/xpdf_example/pdf_examples/ -o $HOME/xpdf_example/out/ -s 123 -- $HOME/xpdf_example/install/bin/pdftotext @@ $HOME/xpdf_example/output
```

## Crash triaging

```
chmod +x scripts/xpdf/xpdf_debug.sh 
```

Then, run gdb with one of the crashes input

```
gdb --args $HOME/xpdf_example/install/bin/pdftotext $HOME/xpdf_example/out/default/crashes/<your_filename> $HOME/fuzzing_xpdf/output
```

at this point, you can

1. `r` to run the program
2. `bt` to show a backtrace on how the crash happened

# `libexif`

## Compile, instrument and install
```
chmod +x scripts/libexif/compile_libexif.sh
scripts/libexif/compile_libexif.sh
cd $HOME
```

## Fuzz `libexif`
```
$HOME/AFLplusplus/afl-fuzz -i $HOME/libexif_example/exif-samples-master/jpg/ -o $HOME/libexif_example/out/ -s 123 -- $HOME/libexif_example/install/bin/exif @@
```

Or, if you installed `AFLplusplus` globally

```
afl-fuzz -i $HOME/libexif_example/exif-samples-master/jpg/ -o $HOME/libexif_example/out/ -s 123 -- $HOME/libexif_example/install/bin/exif @@
```

## Crash triaging

```
chmod +x scripts/libexif/libexif_debug.sh 
```

Then, run gdb with one of the crashes input

```
gdb --args $HOME/libexif_example/install/bin/exif $HOME/libexif_example/out/default/crashes/<your_filename>
```

at this point, you can

1. `r` to run the program
2. `bt` to show a backtrace on how the crash happened

# Slides
If you liked the slides and want to compile a copy for yourself, you can do it by running

```
make main
```

(__N.B__: if you compile it locally, you will need a full tex distribution installed, check it for your environment!)
