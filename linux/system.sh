sudo apt-get install -y \
	build-essential \
	chrome-gnome-shell \
	chromium-browser \
	docker.io \
	gir1.2-clutter-1.0 \
	gir1.2-gtop-2.0 \
	gir1.2-networkmanager-1.0 \
	git \
	gparted \
	htop \
	inxi \
	nautilus-dropbox \
	rake \
	rbenv \
	vim \
	zsh \

sudo snap install spotify

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker $USER

echo "Now, install the system-monitor extension..."
firefox https://extensions.gnome.org/extension/120/system-monitor/ &
read -p "Press enter when complete." foo

echo "\n\e[92m ✔\e[0m \e[1mInstallation complete!\e[0m\n"
