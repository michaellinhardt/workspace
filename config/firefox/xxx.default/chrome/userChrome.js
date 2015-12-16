if (location == "chrome://browser/content/browser.xul") {
	setTimeout(function() {
		if (window.opener == null) {
			window.fullScreen = true;
		}
	}, 1);
}
