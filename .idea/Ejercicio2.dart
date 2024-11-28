import 'dart:io';


void main(){

  var tareas = <Tarea>[];
  bool ciclo = true;
  while (ciclo) {
    print('Ingresa una tarea (ENTER para salir y 0 para mostrar la lista): ');
    String? nombre = stdin.readLineSync();

    if (nombre == '') {
      print('Adios');
      break;
    }
    else if (nombre == '0'){

      print('LISTA DE TAREAS:');

      for (Tarea tarea in tareas){
        print(tarea.toString());
      }
      break;
    }
    else{

      if (nombre == null){
        print('La tarea no puede ser nula.');
      }
      else{
        bool estadoTarea = false;
        while (true){
          print('¿Está terminada? (y/n)');
          String? estado = stdin.readLineSync();
          if(estado == 'y' || estado == 'Y'){
            estadoTarea = true;
            break;
          }
          else if (estado == 'n' || estado == 'N'){
            estadoTarea = false;
            break;
          }
          else{
              print('El valor ingresado no era válido.');
          }
        }
        
        Tarea tarea = new Tarea(nombre, estadoTarea);

        tareas.add(tarea);
      }
    }
  }
}


class Tarea {

  final String tarea;
  final bool estado;

  Tarea(this.tarea, this.estado);



  String toString(){
      if (estado){
        return '$tarea está terminada.';
      }
      return '$tarea está por terminar.';
  }


}