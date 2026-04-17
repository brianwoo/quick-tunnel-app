pkg update
pkg install stunnel p7zip

if [ -e "$HOME/quick-tunnel" ]; then
  echo "quick-tunnel already exists, not overwriting..."
  exit 0
fi

#curl and save the file as data.7z
curl https://raw.githubusercontent.com/brianwoo/quick-tunnel-app/refs/heads/main/data.7z -o data.7z
7z x data.7z
if [ -f "data.7z" ]; then
  rm -f data.7z
fi
echo "install complete. cd quick-tunnel to start"
