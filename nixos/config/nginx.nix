{ config, ... }:
{
	services.nginx = {

		recommendedProxySettings = true;
		recommendedTlsSettings = true;
		appendHttpConfig = ''
			charset utf-8;
			charset_types
				application/atom+xml
				application/json
				application/rss+xml
				application/xml
				image/svg+xml
				text/css
				text/javascript
				text/plain
				text/vcard
				text/vtt
				text/xml;
		'';

		virtualHosts = import ../virtualhosts-private.nix;

	};
}
