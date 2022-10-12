class ShowcaseApp {
  final String name;
  final String? appStoreURL;
  final String? playStoreURL;
  final String? githubURL;
  final String image;

  const ShowcaseApp.withLocalAsset({
    required this.name,
    this.appStoreURL,
    this.playStoreURL,
    this.githubURL,
    required this.image,
  }) : _isNetworkImage = false;

  const ShowcaseApp.withNetworkAsset({
    required this.name,
    this.appStoreURL,
    this.playStoreURL,
    this.githubURL,
    required this.image,
  }) : _isNetworkImage = true;

  final bool _isNetworkImage;
  bool get isNetworkImage => _isNetworkImage;
}

const apps = [
  ShowcaseApp.withLocalAsset(
    name: 'Tentony',
    image: 'assets/images/apps/tentony.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.tentony.app',
    appStoreURL: 'https://apps.apple.com/az/app/tentony/id1630425777',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'Badamlı',
    image: 'assets/images/apps/badamli.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.badamli.app',
    appStoreURL: 'https://apps.apple.com/az/app/badaml%C4%B1/id1627914279',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'KOLI',
    image: 'https://play-lh.googleusercontent.com/atPmL9orJu8IbwlnyENdPm1PRnN04yoWkyT258tfQIsGek5O5Ij43b34rJoPDFphZ4_u=w3024-h1730-rw',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.koli.app',
    appStoreURL: 'https://apps.apple.com/az/app/koli/id1610779509',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'CİB',
    image: 'assets/images/apps/cib.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.cib.app',
    appStoreURL: 'https://apps.apple.com/us/app/cib-az/id1541577214',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Vadi',
    image: 'https://play-lh.googleusercontent.com/3Jt4FmNGu-VMmj4FitOLHhl3jcL_JpV8s-wAKJ8JSIA6QshURf-FaQavN7yc49uFNkyD=w3024-h1730-rw',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.vadi.app',
    appStoreURL: 'https://apps.apple.com/az/app/vadi-karqo/id1605375862',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'MASHIN.AL',
    image: 'assets/images/apps/mashinal.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=ventures.al.mashinal',
    appStoreURL: 'https://apps.apple.com/ru/app/mashin-al/id1588371190',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Dynamex',
    image: 'https://play-lh.googleusercontent.com/bGC6p_dqbxHI5NNVRvxtoK-7gBXWTKPu_M9_3DUDQDyKdlM7c8pa2a3lC_LuJSEE3oE=w2880-h1640',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.dynamex.app',
    appStoreURL: 'https://apps.apple.com/us/app/dynamex/id1559258269',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'wibty',
    image: 'assets/images/apps/wibty.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.wibty.wibty',
    appStoreURL: 'https://apps.apple.com/az/app/wibty/id1568298650',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Eyol',
    image: 'https://play-lh.googleusercontent.com/p4_q8cI6QSi-6iRrhYI5xOUru_abYX-CjEYZHsjaZW1Uz0sr3kAv6YxrJ2I2idKVzFM=w2880-h1640',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.eyol.app',
    appStoreURL: 'https://apps.apple.com/us/app/eyol/id1584765283',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'CASHIM',
    image: 'https://play-lh.googleusercontent.com/lgGaIiZMigLQ2GMdkGUDABPGuOum9PKHgm7VH3oJcfNBKKv3Fj9kxB5-60UR3-a5dzc=w5120-h2880-rw',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.cashim.app',
    appStoreURL: 'https://apps.apple.com/us/app/cashim/id1621054850',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'DoctOnline',
    image: 'assets/images/apps/doctonline.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.doctazer.flutterAndroid',
    appStoreURL: 'https://apps.apple.com/az/app/doctonline/id1487301839',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Zamex',
    image: 'https://play-lh.googleusercontent.com/HU5C9c7N8dHE2MTDd90c_Pok3J3Ly4svwZaGtV8G3WHwMrhJROVB-8GFpNXPMJKQY4fL=w2880-h1640',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.zamex.app',
    appStoreURL: 'https://apps.apple.com/us/app/zamex/id1568168785',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'Ormado Cashbook',
    image: 'assets/images/apps/ormado-cashbook.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.ormado.app',
    appStoreURL: 'https://apps.apple.com/kw/app/ormado-cashbook/id1529717238',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Azex',
    image: 'https://play-lh.googleusercontent.com/Qs1kNkhB8Wdm44zNASJiguxFaITIiikmTs8A9Hx0c7GIAmrm01M84mutRyaLpLoa9BrB=w2880-h1640',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.azex.app',
    appStoreURL: 'https://apps.apple.com/us/app/azex-karqo/id1559676955',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'ManatX',
    image: 'assets/images/apps/manatx.png',
    githubURL: 'https://github.com/kamranbekirovyz/manatx-currency-converter',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Morex',
    image: 'https://play-lh.googleusercontent.com/nGqy-QBmLaVsbC_YXNT_u8sd2U92mSgxueQHTYdv3g4vVTMj-GvsbfCpkSWuc62LHKA=w3024-h1730-rw',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.morex.app',
    appStoreURL: 'https://apps.apple.com/us/app/morex/id1605376153',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'In-App Help Chatbot',
    image: 'images/apps/cib-chatbot.png',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Glob',
    image: 'https://play-lh.googleusercontent.com/LKxlmFJQ3k2jW3eZRbZKZ6Z0xhCctll1P-ZYyAlTSycttSmng_gmBknYLfoSr7QcdHIN=w3024-h1730-rw',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.glob.app',
    appStoreURL: 'https://apps.apple.com/us/app/glob/id1572865371',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'Warehouse Management',
    image: 'images/apps/zamex-station.png',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Vizz',
    image: 'https://play-lh.googleusercontent.com/DbwKumksl4TzOCi3cXXB7KSnRksmNQ4FW0lC1fsn32ZSMQmxtALtwTjc60ubPhAFK1c=w3360-h1940',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.vizz.vizz',
    appStoreURL: 'https://apps.apple.com/az/app/vizz/id1558819171',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Trendex',
    image: 'https://play-lh.googleusercontent.com/0K7eTRgeECyz3SNSLa0_5qE_wiMCdqccMDInfvRjkFAtkQClBm1mc8lsAvIrQstWbnQ=w2880-h1640',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.trendex.app',
    appStoreURL: 'https://apps.apple.com/us/app/trendex-karqo/id1604065036',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'DentiStore',
    image: 'assets/images/apps/dentistore.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.abasoft.dentistore',
    appStoreURL: 'https://apps.apple.com/us/app/dentistore/id1576104680',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'jetex',
    image: 'https://play-lh.googleusercontent.com/j4tsWZkn1f34bInvklE9c77E874gaPyM0qIf9iFggBH3BKT6oCip0tUwKizQTB0YfG7g=w3024-h1730-rw',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.jetex.app',
    appStoreURL: 'https://apps.apple.com/us/app/jetex/id1611723529',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'SLOOOVA',
    image: 'assets/images/apps/slooova.png',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Bahar Karqo',
    image: 'https://play-lh.googleusercontent.com/IP4Ketx5uxaf4NrgdzrD_5SZELY1E3-JKWeukNNdHaqThVp76FPCIf-wfTLjssy1QQ=w5120-h2880-rw',
    playStoreURL: 'https://play.google.com/store/apps/details?id=az.baharkargo.app',
    appStoreURL: 'https://apps.apple.com/az/app/bahar-karqo/id1621054829',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'FLO Azerbaijan',
    image: 'https://play-lh.googleusercontent.com/0YFGTvYE-5qK7AC4fMjsPI7EZPGeE_y5kG0MxybYSvT5X8TH5Rob4K_adCteVPuFZBs=w3360-h1940',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.frazex.onlinestore.flo',
    appStoreURL: 'https://apps.apple.com/az/app/flostore-az/id1514948886',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Lilac',
    image: 'https://play-lh.googleusercontent.com/pvvGGpEMR6LS95aFIyr4d_BK3yorFJD2WwQegICMJ0kdd48_u3Xn1ggzEP6XG-IJeBY=w3360-h1940',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.frazec.onlinestore.lilac',
    appStoreURL: 'https://apps.apple.com/az/app/lilac-az/id1535781509',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'BakuTransport',
    image: 'https://play-lh.googleusercontent.com/vnL2g2rQgjsSElaJSpKT8asCoPfgvgBrF8xjBUWcQbThvoIfQoK_nOIkYJnUXddR7bA=w3360-h1940',
    githubURL: 'https://play.google.com/store/apps/details?id=com.azcode.bakutransport',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'Rahat Kart',
    image: 'assets/images/apps/rahat.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=frazex.com.inloya.rahat',
    appStoreURL: 'https://apps.apple.com/us/app/rahat-kart/id1478512091',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'Tezibu Delivery',
    image: 'assets/images/apps/tezibu-client.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.frazex.a7575.tezibu.client',
    appStoreURL: 'https://apps.apple.com/az/app/tezibu/id1518022392',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'Tezibu Partner',
    image: 'assets/images/apps/tezibu-partner.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.frazex.tezibu.partner',
    appStoreURL: 'https://apps.apple.com/az/app/tezibu-partner/id1516765771',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'Tezibu Courier',
    image: 'assets/images/apps/tezibu-courier.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.frazex.u7575.tezibu.courier',
    appStoreURL: 'https://apps.apple.com/az/app/tezibu-courier/id1517005869',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'GAGA Beauty Factory',
    image: 'https://play-lh.googleusercontent.com/Nh5Q8ZRElGmDsjM47heZfQesRt4estpTds0b6-Xklb3xJtiGV8mxll2hqnd-ft5q6b8=w3360-h1940',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.frazex.loyalty.gagabf',
    appStoreURL: 'https://apps.apple.com/az/app/gaga-beauty/id1521427476',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Unity Food',
    image: 'https://play-lh.googleusercontent.com/hjVGBNzSFeaZZvYcRHe5jFcBKirdOx_tGmRWRzOZYsdxMKQD_qzjSPdhdCLi4ZkadqI=w3360-h1940',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.frazex.onlinestore.neptunexpress',
    appStoreURL: 'https://apps.apple.com/az/app/unity-food/id1539019198',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'Nata Studio',
    image: 'assets/images/apps/nata-studio.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.frazex.loyalty.natastudio',
    appStoreURL: 'https://apps.apple.com/az/app/nata-studio/id1535811378',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'BIG CHEFS',
    image: 'https://play-lh.googleusercontent.com/FKHFiTqsZN0czAbEqbDMHHBeCPwMyE5UG2OM21C3Cr97HDxFhLlVaZIehw3Z5QSuJMc=w3360-h1940',
    playStoreURL: 'https://play.google.com/store/apps/details?id=frazex.com.inloya.bigchefs',
    appStoreURL: 'https://apps.apple.com/az/app/bigchefs-az/id1517277535',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Music Downloader & Player',
    image: 'assets/images/apps/docswis.png',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'StatsUpp - WhatsApp Status Downloader',
    image: 'assets/images/apps/statsupp.png',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'LePlaisire',
    image: 'assets/images/apps/le-plaisire.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=frazex.com.inloya.leplaisir',
    appStoreURL: 'https://apps.apple.com/az/app/le-plaisir/id1517308551',
  ),
  ShowcaseApp.withLocalAsset(
    name: 'Gunka Beauty House',
    image: 'assets/images/apps/gunka-beauty-house.png',
    playStoreURL: 'https://play.google.com/store/apps/details?id=frazex.com.inloya.paintnail',
    appStoreURL: 'https://apps.apple.com/az/app/gunka-beauty-house/id1518607512',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Polymart',
    image: 'https://play-lh.googleusercontent.com/wisTAwjkzedaLcvwLPA-vsrdzoA10jX4Cq0-8pb6LHejnv5iveBZFbyTC4CyPzP2Vo_C=w3360-h1940',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.frazex.onlinestore.polymart',
    appStoreURL: 'https://apps.apple.com/az/app/polymart/id1518597954',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Monteleone',
    image: 'https://play-lh.googleusercontent.com/NjllrmWrfATgfcvw3G5wIMIKpBV8Nim3rbnLFoT9ojpzZQhxUThyFVFtN-HnQKYAgT0=w3360-h1996',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.frazex.loyalty.monteleone',
    appStoreURL: 'https://apps.apple.com/az/app/monteleone/id1521424575',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'Zoobastik',
    image: 'https://play-lh.googleusercontent.com/-qU7YDfc3CnQC3Hk5QNCU_fFnKvyozAvz3YljgxzlRnuSXNMglSnJqZQxSjuIq6xlNg=w3360-h1940',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.frazex.onlinestore.zoobastik',
    appStoreURL: 'https://apps.apple.com/az/app/zoobastik/id1514949924',
  ),
  ShowcaseApp.withNetworkAsset(
    name: 'NAMU Cosmetics',
    image: 'https://play-lh.googleusercontent.com/4Clyh5R1nWknklHMvpkGO6lSTZ3wXZDn_jdXuIVdHkuCZ6OdLK6577zfZsjr46HnkK4=w3360-h1940',
    playStoreURL: 'https://play.google.com/store/apps/details?id=com.frazex.onlinestore.namu',
    appStoreURL: 'https://apps.apple.com/az/app/namu-az/id1516466622',
  ),
];
