class Alarm {
  String nombre;
  String fecha;
  String tipo;
  String descripcion;
  String lugar;
  Ajuste ajuste;
  List<String> contacts;
  Alarm(
    this.nombre,
    this.fecha,
    this.tipo,
    this.ajuste, {
    this.contacts = const [],
    this.lugar = "",
    this.descripcion = "",
  });
  Alarm copyWith({
    String? nombre,
    String? fecha,
    String? tipo,
    Ajuste? ajuste,
    List<String>? contacts,
    String? lugar,
    String? descripcion,
  }) =>
      Alarm(nombre ?? this.nombre, fecha ?? this.fecha, tipo ?? this.tipo,
          ajuste ?? this.ajuste,
          descripcion: descripcion ?? this.descripcion,
          lugar: lugar ?? this.lugar,
          contacts: contacts ?? this.contacts);
}

class Ajuste {
  String notificarCada;
  String notificarAntes;
  double volume;
  String sonido;
  Ajuste(this.notificarAntes, this.notificarCada, this.volume, this.sonido);
  Ajuste copyWith({
    String? notificarCada,
    String? notificarAntes,
    double? volume,
    String? sonido,
  }) =>
      Ajuste(
        notificarCada ?? this.notificarCada,
        notificarAntes ?? this.notificarAntes,
        volume ?? this.volume,
        sonido ?? this.sonido,
      );
}
