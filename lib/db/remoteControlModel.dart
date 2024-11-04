class RemoteControlParams {
  final int? id;
  final String name;
  final String brand;
  final String category;
  final List<int>? powerBtn;
  final List<int>? exitBtn;
  final List<int>? menuBtn;
  final List<int>? upBtn;
  final List<int>? leftBtn;
  final List<int>? okBtn;
  final List<int>? rightBtn;
  final List<int>? downBtn;
  final List<int>? channelUpBtn;
  final List<int>? channelDownBtn;
  final List<int>? volumeUpBtn;
  final List<int>? volumeDownBtn;
  final List<int>? tvAvBtn;
  final List<int>? muteBtn;

  RemoteControlParams({
    this.id,
    required this.name,
    required this.brand,
    required this.category,
    this.powerBtn,
    this.exitBtn,
    this.menuBtn,
    this.upBtn,
    this.leftBtn,
    this.okBtn,
    this.rightBtn,
    this.downBtn,
    this.channelUpBtn,
    this.channelDownBtn,
    this.volumeUpBtn,
    this.volumeDownBtn,
    this.tvAvBtn,
    this.muteBtn,
  });

  RemoteControlParams.basic({
    this.id,
    required this.name,
    required this.brand,
    this.category = '',
  })  : powerBtn = null,
        exitBtn = null,
        menuBtn = null,
        upBtn = null,
        leftBtn = null,
        okBtn = null,
        rightBtn = null,
        downBtn = null,
        channelUpBtn = null,
        channelDownBtn = null,
        volumeUpBtn = null,
        volumeDownBtn = null,
        tvAvBtn = null,
        muteBtn = null;

  RemoteControlParams.withButtons({
    required this.id,
    required this.powerBtn,
    required this.exitBtn,
    required this.menuBtn,
    required this.upBtn,
    required this.leftBtn,
    required this.okBtn,
    required this.rightBtn,
    required this.downBtn,
    required this.channelUpBtn,
    required this.channelDownBtn,
    required this.volumeUpBtn,
    required this.volumeDownBtn,
    required this.tvAvBtn,
    required this.muteBtn,
  })  : name = '',
        brand = '',
        category = '';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'category': category,
      'powerBtn': powerBtn,
      'exitBtn': exitBtn,
      'menuBtn': menuBtn,
      'upBtn': upBtn,
      'leftBtn': leftBtn,
      'okBtn': okBtn,
      'rightBtn': rightBtn,
      'downBtn': downBtn,
      'channelUpBtn': channelUpBtn,
      'channelDownBtn': channelDownBtn,
      'volumeUpBtn': volumeUpBtn,
      'volumeDownBtn': volumeDownBtn,
      'tvAvBtn': tvAvBtn,
      'muteBtn': muteBtn,
    };
  }
}
