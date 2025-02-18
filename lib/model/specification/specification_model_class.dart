class SpecificationModelClass {
  String? status;
  Data? data;

  SpecificationModelClass({this.status, this.data});

  SpecificationModelClass.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Description? processor;
  Description? storage;
  Description? display;
  Description? ram;
  Description? simCard;
  Description? camera;
  Description? network;
  Description? battery;
  Description? deviceSensors;

  Data(
      {this.processor,
        this.storage,
        this.display,
        this.ram,
        this.simCard,
        this.camera,
        this.network,
        this.battery,
        this.deviceSensors});

  Data.fromJson(Map<String, dynamic> json) {
    processor = json['processor'] != null
        ? new Description.fromJson(json['processor'])
        : null;
    storage = json['storage'] != null
        ? new Description.fromJson(json['storage'])
        : null;
    display = json['display'] != null
        ? new Description.fromJson(json['display'])
        : null;
    ram = json['ram'] != null ? new Description.fromJson(json['ram']) : null;
    simCard = json['simCard'] != null
        ? new Description.fromJson(json['simCard'])
        : null;
    camera =
    json['camera'] != null ? new Description.fromJson(json['camera']) : null;
    network = json['network'] != null
        ? new Description.fromJson(json['network'])
        : null;
    battery = json['battery'] != null
        ? new Description.fromJson(json['battery'])
        : null;
    deviceSensors = json['device_sensors'] != null
        ? new Description.fromJson(json['device_sensors'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.processor != null) {
      data['processor'] = this.processor!.toJson();
    }
    if (this.storage != null) {
      data['storage'] = this.storage!.toJson();
    }
    if (this.display != null) {
      data['display'] = this.display!.toJson();
    }
    if (this.ram != null) {
      data['ram'] = this.ram!.toJson();
    }
    if (this.simCard != null) {
      data['simCard'] = this.simCard!.toJson();
    }
    if (this.camera != null) {
      data['camera'] = this.camera!.toJson();
    }
    if (this.network != null) {
      data['network'] = this.network!.toJson();
    }
    if (this.battery != null) {
      data['battery'] = this.battery!.toJson();
    }
    if (this.deviceSensors != null) {
      data['device_sensors'] = this.deviceSensors!.toJson();
    }
    return data;
  }
}

class Description {
  String? name;
  String? content;

  Description({this.name, this.content});

  Description.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['content'] = this.content;
    return data;
  }
}