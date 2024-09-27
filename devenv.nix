{pkgs, ...}: {
  packages = [pkgs.gomod2nix pkgs.hugo];

  # https://devenv.sh/languages/
  languages.go.enable = true;

  # https://devenv.sh/services/

  # https://devenv.sh/scripts/
  scripts.serve.exec = ''
    hugo-obsidian -input=content -output=assets/indices -index -root=.
    ${pkgs.hugo}/bin/hugo server --enableGitInfo --minify '';

  scripts.update.exec = ''
    git pull
    go get github.com/evanaze/hugo-obsidian
  '';

  # https://devenv.sh/tests/

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks = {
  #   govet = {
  #     enable = true;
  #     pass_filenames = false;
  #   };
  #   gotest.enable = true;
  #   golangci-lint = {
  #     enable = true;
  #     pass_filenames = false;
  #   };
  # };
}
