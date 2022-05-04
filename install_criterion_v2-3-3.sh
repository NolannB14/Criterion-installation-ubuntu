#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Criterion Ubuntu Installation : Please run as root"
  exit
fi

cd $HOME

echo "--- INSTALLATION CRITERION ---"
echo -e "__v2.3.3 - Release -> Let's Begin\n\n"

echo -n "Clone repository ---"
git clone https://github.com/Snaipe/Criterion.git &> /dev/null
cd Criterion
echo -e " Done.\n"
echo -n "Change Criterion Version ---"
git checkout v2.3.3 &> /dev/null
echo -e " Done.\n"
echo -n "Add Submodule ---"
git submodule update --init --recursive &> /dev/null
echo -e " Done.\n"
echo -n "CMAKE ---"
sudo cmake . &> /dev/null
echo -e " Done.\n"
echo -n "MAKE ---"
sudo make &> /dev/null
echo -e " Done.\n"
echo -n "Copy Headers ---"
cp -r ./include/criterion /usr/include &> /dev/null
echo -e " Done.\n"
echo -n "Copy .so files ---"
cp -r libcriterion.so* /usr/lib64 &> /dev/null
cp -r libcriterion.so* /usr/lib/x86_64-linux-gnu &> /dev/null
echo -e " Done.\n"

echo -n "Remove Installation folder ---"
cd ../ && sudo rm -rf Criterion
echo -e " Done.\n"

echo "--- END OF INSTALLATION ---"