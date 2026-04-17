pkg update
pkg install stunnel p7zip

if [ -e "$HOME/quick-tunnel" ]; then
  echo "quick-tunnel already exists, not overwriting..."
  exit 0
fi

#curl and save the file as data.7z
curl https://raw.githubusercontent.com/brianwoo/quick-tunnel-app/refs/heads/main/data.7z -o data.7z

read -s -p "Enter Family Password: " password < /dev/tty
echo ""
7z x "data.7z" -p"$password" -y

if [ -f "$HOME/data.7z" ]; then
  rm -f "$HOME/data.7z"
fi

echo ""
if [ -e "$HOME/quick-tunnel" ]; then
  echo "Install SUCCESSFUL. cd quick-tunnel to start"
else
  echo "Install FAILED, wrong password, maybe?"
fi
