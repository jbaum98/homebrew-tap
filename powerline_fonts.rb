require 'formula'

class PowerlineFonts < Formula
  url 'git@github.com:powerline/fonts.git', :using => :git, :revision => "8aab61d375f15a86f0a51d326f2417df9c4a0e52"
  homepage 'http://powerline.readthedocs.org/en/latest/installation.html#fonts-installation'
  version "1.0.0"

  def install
    File.open('.fonts.conf', 'w') do |file|
      file.write <<-EOS.undent
      <?xml version="1.0"?>
      <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
      <fontconfig>
        <dir>/usr/local/share/fonts</dir>
      </fontconfig>
      EOS
    end
    fonts = share+"fonts"
    fonts.install Dir['*']
    fonts.install Dir['.fonts.conf']
  end

  def caveats
    <<-EOS.undent
      Make sure to install .fonts.conf correctly on Chromebooks


        mkdir -p /tmp/test/
        sudo mount --bind /home/chronos/ /tmp/test/
        cd /tmp/test/user
        ln -s #{HOMEBREW_PREFIX}/share/fonts/.fonts.conf .

    EOS
  end

end
