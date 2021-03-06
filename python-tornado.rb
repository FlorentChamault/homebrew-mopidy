require 'formula'

class PythonTornado < Formula
  homepage 'http://www.tornadoweb.org/'
  url 'https://pypi.python.org/packages/source/t/tornado/tornado-4.1.tar.gz'
  sha1 'c6bd9ccd6d5449c36206ee83a02e8fc854158bf8'
  head 'https://github.com/tornadoweb/tornado.git'

  depends_on :python => :recommended
  depends_on :python3 => :optional
  depends_on 'mopidy/mopidy/python-backports-ssl-match-hostname'
  depends_on 'mopidy/mopidy/python-certifi'

  def install
    Language::Python.each_python(build) do |python, version|
      system python, "setup.py", "install", "--prefix=#{prefix}",
        "--single-version-externally-managed", "--record=installed.txt"
    end
  end

  def test
    Language::Python.each_python(build) do |python, version|
      system python, "-c", "import tornado"
    end
  end
end
