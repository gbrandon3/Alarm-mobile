class Alarm {
  String nombre;
  String fecha;
  String descripcion;
  String lugar;
  Ajuste ajuste;
  Alarm(this.nombre, this.fecha, this.ajuste,
      {this.lugar = "", this.descripcion = ""});
}

class Ajuste {
  String notificarCada;
  String notificarAntes;
  double volume;
  String sonido;
  Ajuste(this.notificarAntes, this.notificarCada, this.volume, this.sonido);
}
