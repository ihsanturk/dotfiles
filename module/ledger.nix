{ config, lib, pkgs, ... }:
{

config.home.file.".ledgerrc".text = ''
--sort date
--start-of-week=1
--date-format %Y-%m-%d
--input-date-format %Y-%m-%d
--price-db $HOME/Sync/log/price.db
--file $HOME/Sync/log/money/main.ledger
'';

}
