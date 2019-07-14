#!/bin/sh

DOWNLOAD_LINK=$(curl -s https://update.code.visualstudio.com/latest/darwin/stable | grep -o 'https://[^"]*')

echo "Downloading VSCode from '$DOWNLOAD_LINK'"
curl -o ~/vscode.zip $DOWNLOAD_LINK
echo ""

if [ -e ~/vscode.zip ]; then
echo "Downloaded file ~/vscode.zip detected"
    if [ -d /Applications/Visual\ Studio\ Code.app ]; then
    echo "Removing old VSCode from /Applications     !!sudo required!!"
    sudo rm -rf /Applications/Visual\ Studio\ Code.app
    fi
fi
echo ""

echo "Extracting VSCode to /Applications     !!sudo required!!"
sudo unzip -o ~/vscode.zip -d "/Applications" 
echo ""

echo "Removing ~/vscode.zip"
rm ~/vscode.zip