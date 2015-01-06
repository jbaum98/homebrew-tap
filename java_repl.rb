require 'formula'

class JavaRepl < Formula
  url "http://albertlatacz.published.s3.amazonaws.com/repo/javarepl/javarepl/#{version}/javarepl-#{version}.jar"
  homepage 'http://www.javarepl.com/console.html'
  version "272"

  def install
    lib.install "javarepl-#{version}.jar"
    script = Pathname.new "#{bin}/javarepl"
    script.chmod '+x'
    script.write <<-EOS.undent
    #!/usr/bin/env bash
    java -jar #{lib}/javarepl-#{version}.jar
    EOS
  end

end
