{ config, ... }: {


	# FIXME: '/Users/ihsan' should be a variable pointing to HOME.

config.home.file.".ledgerrc".text = ''
--sort date
--start-of-week=1
--date-format %Y-%m-%d
--input-date-format %Y-%m-%d
--price-db /Users/ihsan/Sync/log/price.db
--file /Users/ihsan/Sync/log/money/main.ledger
'';

}
