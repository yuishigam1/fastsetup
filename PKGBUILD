# Maintainer: Yash <xofficialyashx@gmail.com>
pkgname=fastsetup
pkgver=1.0.0
pkgrel=1
pkgdesc="Auto setup Arch + Hyprland dotfiles from remote repo"
arch=('any')
url="https://github.com/yuishigam1/fastsetup"
license=('MIT')
depends=('git' 'zsh' 'neovim' 'hyprland')
makedepends=('git')
provides=('fastsetup')
conflicts=('fastsetup-git')
source=("install.sh")
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/install.sh" "$pkgdir/usr/bin/fastsetup"
}
