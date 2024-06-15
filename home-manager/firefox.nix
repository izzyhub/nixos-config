{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    #profiles.izzy = {
      #search.default = "Google";
      #search.force = true;
      #extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        #clearurls
        #vimium
	#autotab-discard
	#firefox-colors
	#stylus
      #];
    };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/x-extension-htm" = [ "firefox.desktop" ];
      "application/x-extension-html" = [ "firefox.desktop" ];
      "application/x-extension-shtml" = [ "firefox.desktop" ];
      "application/x-extension-xht" = [ "firefox.desktop" ];
      "application/x-extension-xhtml" = [ "firefox.desktop" ];
      "application/x-www-browser" = [ "firefox.desktop" ];
      "application/xhtml+xml" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/chrome" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/ftp" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
      "x-scheme-handler/webcal" = [ "firefox.desktop" ];
      "x-www-browser" = [ "firefox.desktop" ];
    };
    associations.added = {
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "text/html" = [ "firefox.desktop" ];
    };
  };
}
