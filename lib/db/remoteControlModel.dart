class RemoteControlParams {
  final int? id;
  final String name;
  final String brand;
  final String model;
  final String category;
  final String? powerBtn;
  final String? exitBtn;
  final String? menuBtn;
  final String? upBtn;
  final String? leftBtn;
  final String? okBtn;
  final String? rightBtn;
  final String? downBtn;
  final String? channelUpBtn;
  final String? channelDownBtn;
  final String? volumeUpBtn;
  final String? volumeDownBtn;
  final String? tvAvBtb;
  final String? muteBtn;

  RemoteControlParams({
    this.id,
    required this.name,
    required this.brand,
    required this.model,
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
    this.tvAvBtb,
    this.muteBtn,
  });
}