# Maintainer: Yash <xofficialyashx@gmail.com>
pkgname=fastsetup
pkgver=1.0.0
pkgrel=1
pkgdesc="Dotfiles auto-setup tool for Arch + Hyprland"
arch=('any')
url="https://github.com/yuishigam1/fastsetup"
license=('MIT')
depends=('git' 'zsh' 'neovim' 'hyprland') # add your dependencies here
makedepends=()
provides=('fastsetup')
conflicts=()
source=("git+$url.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 install.sh "$pkgdir/usr/bin/fastsetup"
}
