{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  version = "2.3.1";
  name = "graylog-${version}";

  src = fetchurl {
    url = "https://packages.graylog2.org/releases/graylog/graylog-${version}.tgz";
    sha256 = "1zms24w4lnisjqgkj4a8cmnmlvpsqjl1sab5k99dyknq7b31x0sd";
  };

  dontBuild = true;
  dontStrip = true;

  installPhase = ''
    mkdir -p $out
    cp -r {graylog.jar,lib,bin,plugin,data} $out
  '';

  meta = with stdenv.lib; {
    description = "Open source log management solution";
    homepage    = https://www.graylog.org/;
    license     = licenses.gpl3;
    platforms   = platforms.unix;
    maintainers = [ maintainers.fadenb ];
  };
}
