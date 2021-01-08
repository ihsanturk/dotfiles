{ config, lib, pkgs, ... }:
{

config.home.file.".ledgerrc".text = ''
--sort date
--start-of-week=1
--date-format %Y-%m-%d
--input-date-format %Y-%m-%d
--price-db ${config.home.homeDirectory}/Sync/log/price.db
--file ${config.home.homeDirectory}/Sync/log/money/main.ledger
'';

}
