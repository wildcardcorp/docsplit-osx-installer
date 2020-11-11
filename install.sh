#!/bin/bash
# macOS installer for https://documentcloud.github.io/docsplit/
# tested on Catalina 10.15.7

source lib/lambda.sh

# install pdftk
if pdftk --version; then
    echo "pdftk already installed, skipping . ."
else
    wget https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk_server-2.02-mac_osx-10.11-setup.pkg
    open pdftk_server-2.02-mac_osx-10.11-setup.pkg
    echo "press enter to continue . ."
    lambda "exit(0) if '\n' == line else line"
    rm pdftk_server-2.02-mac_osx-10.11-setup.pkg*
fi

# install brew dependencies
brew install \
graphicsmagick \
poppler \
ghostscript \
tesseract
brew cask install libreoffice

# install docsplit
if docsplit --version; then
    echo "docsplit already installed, skipping . ."
else
    sudo gem install docsplit
fi
