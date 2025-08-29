
{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "consolas-lxgw-wenkai-mono";
  version = "2025.08.25";  # 可以写日期，或 commit short hash

  # 使用 fetchFromGitHub 拉取整个仓库
  src = fetchFromGitHub {
    owner = "MichaelC001";
    repo = "Consolas-Nerd-LXGW-Wenkai-Mono";
    rev = "fb06baa8739d20c5e02cf19ba2554b3a231a700a";  # 或具体 commit hash 更稳定，比如 "a1b2c3d4e5f6..."
    sha256 = "sha256-Z6dbZnfY+KmB8uZ6RNt4U73WQFPXObnZv1+Bc9ngPGU="; # 等下生成
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/
    install -Dm644 *.ttf $out/share/fonts/

    runHook postInstall
  '';

  meta = with lib; {
    description = "Consolaslxgw";
    homepage = "https://github.com/MichaelC001/Consolas-Nerd-LXGW-Wenkai-Mono";
    license = lib.licenses.gpl3;
    # maintainers = [ lib.maintainers.maidf ];
    platforms = platforms.all;
  };
}