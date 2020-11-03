self: super:

with super.lib;

let
  fetchFont = super.callPackage ./fetch-font.nix { };

  nameFrom = src: removeSuffix ".zip" (toLower src);

  mapFont = { version ? "2.1.0", zipname, sha256, name ? nameFrom zipname }:
    nameValuePair
      name
      (fetchFont { inherit name zipname sha256 version; });

  mapFonts = fonts: listToAttrs (map mapFont fonts);
in {
  nerd-fonts = mapFonts [
    {
      zipname = "3270.zip";
      sha256 = "0iycks121cxk3v974p6dpcg9mdyq1bx0lvjrv4d5filq3x5frqc7";
    }
    {
      zipname = "Agave.zip";
      sha256 = "0brxjwr72vlzicrsmh4s28qvysjqrfcsjhwhqqlwmlw9sgmijgdl";
    }
    {
      zipname = "AnonymousPro.zip";
      sha256 = "139sksiwargv6qxqzjpbia0f865q6q9x30j2fzkac5ajm850an46";
    }
    {
      zipname = "Arimo.zip";
      sha256 = "1grpy95pihxp3lk9vk9pi3jxm8b8mf1b99gnipr9pj55s7byhgai";
    }
    {
      zipname = "AurulentSansMono.zip";
      sha256 = "03cgfndrrgjmml8a6rvxza4rbksmml95ca5a8kr4dirgcbwmqg6j";
    }
    {
      zipname = "BigBlueTerminal.zip";
      sha256 = "1i0y3811b6nvxlhr5ykba4107i13kylisqj2r0vgwd1gkfkghqvj";
    }
    {
      zipname = "BitstreamVeraSansMono.zip";
      sha256 = "1x2zjb2ngz8jrpgi52z1gslx2z212fx53nbn6rjzhhwa61kidy7l";
    }
    {
      zipname = "CascadiaCode.zip";
      sha256 = "1kf2mc51zjcmph5fp2hjawiqwlc7ld1mrzl2ln8mpbrjpm2a5w9i";
    }
    {
      zipname = "CodeNewRoman.zip";
      sha256 = "0sxv937gyl82nakbm4g52ygw4rmjq6b7fdjpq2v91i2sv6wmyhwd";
    }
    {
      zipname = "Cousine.zip";
      sha256 = "1fji9kqz2nnfbqz1iki48z9zxz96c114v510bfnwagn9wp1yf4y5";
    }
    {
      zipname = "DaddyTimeMono.zip";
      sha256 = "0qy30dhcs718ng5q9q4cr3pf2nx66z5vl338nb4n9xr8iq9fas3m";
    }
    {
      zipname = "DejaVuSansMono.zip";
      sha256 = "0layf0x6hq4rbz64f9p2sgypllm0v41z6d0n7bzq44dm0zjlcm14";
    }
    {
      zipname = "DroidSansMono.zip";
      sha256 = "0qg68q14b3nmrq6k2bfcdbj91skk6vrrlkw2lz2p24vwd81w87i5";
    }
    {
      zipname = "FantasqueSansMono.zip";
      sha256 = "04cgnfcj3px176hfa4yqinm43yq6b9khpdfnr7ym1l719xvgq9zd";
    }
    {
      zipname = "FiraCode.zip";
      sha256 = "0nfxh0bzs68ljp0n4dcg0afsbpwjvc8m359ckrf2phd56gwmmmyd";
    }
    {
      zipname = "FiraMono.zip";
      sha256 = "18m60z787ivzrx3s9cxjf1v2707976sr42akm0clgg30d81lhycq";
    }
    {
      zipname = "Go-Mono.zip";
      sha256 = "1i2cpxmha867wv20k924dpy0v6rnwpj2j4xxs0b9a2ws0k94kcmd";
    }
    {
      zipname = "Gohu.zip";
      sha256 = "0hchpbqmv6igq0k2d119fl41zzhdrnxk9iwnr8ikibvlj1db824c";
    }
    {
      zipname = "Hack.zip";
      sha256 = "02hx18dj50s1v2nrb2zqc78169cnrb030yds6dw5na006cdhqfgk";
    }
    {
      zipname = "Hasklig.zip";
      sha256 = "1q16l0gy7kd79ck3li4ndd3zbhrfh8qz0j85qlyzkvqx2cw7ar4y";
    }
    {
      zipname = "HeavyData.zip";
      sha256 = "1yy0lcama9kxlv0az35gwp4sk5m93179jvwxgvlikibh4gzry5yl";
    }
    {
      zipname = "Hermit.zip";
      sha256 = "1x1zi7sh6lmkrb25f6dbpfdjf0ha5km71w52cwizwqkibdi2dflg";
    }
    {
      zipname = "iA-Writer.zip";
      sha256 = "0vslhf384gdgiypdza662k44n78qr4cjzmy1n1nmrzm41v6ppvv8";
    }
    {
      zipname = "IBMPlexMono.zip";
      sha256 = "05mwp5kj4jv31d6cs7w4jzcjfa16qac1sifqm2lxz7i277xzpncf";
    }
    {
      zipname = "Inconsolata.zip";
      sha256 = "182888rrmandmflqrx8hz2jl8rjgxdcncld02plr0ny29kr3palr";
    }
    {
      zipname = "InconsolataGo.zip";
      sha256 = "1r6shs6x6mkr30zmch1r9phq399nhz3qxxa4clv5j5vlxf0ajvcf";
    }
    {
      zipname = "InconsolataLGC.zip";
      sha256 = "1h8h6caimc3k7ayr8h5k0w440d08j2dfs9zm5i5rjjnwriq8jn14";
    }
    {
      zipname = "Iosevka.zip";
      sha256 = "0cbh23xp5l0ac5kf8jl9acrlyd34667vkakg9dzigzl5ha93dqws";
    }
    {
      zipname = "JetBrainsMono.zip";
      sha256 = "07xix6ck8v02nk021frs0dp441292d3pxbdfjjp9jndnjp0c6plk";
    }
    {
      zipname = "Lekton.zip";
      sha256 = "1w8mvvpnvdsb7r4hj690rpgzsk6sgym75n213glaajs94s5f5kmj";
    }
    {
      zipname = "LiberationMono.zip";
      sha256 = "06sh0prmzglrq5nw33d9hmhhywq2v6pdfd46cbvggxw3v79qiy9n";
    }
    {
      zipname = "Meslo.zip";
      sha256 = "1i6nl4ccsx585qhkdinj4l6bwppj0b5naa65fagcdmyxm1cz895b";
    }
    {
      zipname = "Monofur.zip";
      sha256 = "0glppnghxpm95rxzznpl6ydb3nd2dprz7qb1x169qjkn3c35gby7";
    }
    {
      zipname = "Monoid.zip";
      sha256 = "1xjsbc7g2bi4s52sfg89v73c6kfvb4lbk39kh8200kyffw011c8h";
    }
    {
      zipname = "Mononoki.zip";
      sha256 = "1pbgcyg6aabj18vnv1smvcfzipiim8riyimiwxv8zzlfd4apdmzh";
    }
    {
      zipname = "MPlus.zip";
      sha256 = "12z42pgd80xawv977g23pqb0j5l5kknm241hmq7zqfaj9x1bydc8";
    }
    {
      zipname = "Noto.zip";
      sha256 = "1i44nzsxcagnf46g95c2hc81vpqd9dc86lwa4v5z356dvcnj7573";
    }
    {
      zipname = "OpenDyslexic.zip";
      sha256 = "1qjw6z5q2afwa26yck77shn6byizn9yv9j0n2w11zjdnz9fdr0pr";
    }
    {
      zipname = "Overpass.zip";
      sha256 = "0cv65vchwjxlahakxxh077q7wqmgw4md9v39gkvwkln45gs1a2lk";
    }
    {
      zipname = "ProFont.zip";
      sha256 = "0byavd3n2sllpxri2z71rj6n579v264v7p1w5aqzc6049x7qwncf";
    }
    {
      zipname = "ProggyClean.zip";
      sha256 = "0bcpd1wg2jv1wqfnk986xcmv4q1pclk4hz6ikl73chb9q2gbsfdn";
    }
    {
      zipname = "RobotoMono.zip";
      sha256 = "1d9kskpz5y3daqpq8y61vkn7fc5a2izy2w3n9ikn121vch16641c";
    }
    {
      zipname = "ShareTechMono.zip";
      sha256 = "1qksav2ndwcwsfqh87abklrwxsg84ffpmcnjkbld99ibb88r5578";
    }
    {
      zipname = "SourceCodePro.zip";
      sha256 = "02zmm51hpzkcxvgczj8mfm1v9rg6xl5yf0knc6fmkn2m8d93i01g";
    }
    {
      zipname = "SpaceMono.zip";
      sha256 = "08v26inyfpz35kaa399p8w318c1lmykna2s5izgib6g5mnf9k6y9";
    }
    {
      zipname = "Terminus.zip";
      sha256 = "01v829z6r6lmp2dkkgc3i5xwj6q95c252jp97rdflsvf1lcw4n98";
    }
    {
      zipname = "Tinos.zip";
      sha256 = "1kl2lqmczchbp532bnai2dijbwbdpk4f1v9rrkr0hx2l61qakwyr";
    }
    {
      zipname = "Ubuntu.zip";
      sha256 = "1kr9axb80zk1v83ayyf9fax1z49vpkd59ibmsl8i9vp02925imm5";
    }
    {
      zipname = "UbuntuMono.zip";
      sha256 = "1spisg8x4p2psrimrgjvlybx2z39yms2390k70az25kwwccrfxw0";
    }
    {
      zipname = "VictorMono.zip";
      sha256 = "0cl48j5yza8cyffavdc7rpc83iladv9lc4vk8s2lm6kmyrahwqn9";
    }
  ];
}
