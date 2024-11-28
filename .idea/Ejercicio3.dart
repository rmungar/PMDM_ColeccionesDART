import 'dart:io';

void main(){
  Map<String, Map<String, List<double>>> estudiantes = {  };


  bool ciclo = true;
  while (ciclo) {
    print('A - AÑADIR');
    print('M - MOSTRAR');
    print('S - SALIR');

    String? opcion = stdin.readLineSync();

    if (opcion != null){
      switch (opcion.toUpperCase()){

        case 'A':
          Add(estudiantes);

        case 'M':
          Mostrar(estudiantes);

        case 'S':
          break;

        default:
          print('Opcion no válida');
      }
    }

  }

}



void Add(Map<String, Map<String, List<double>>> lista){
  bool ciclo = true;
  while (ciclo) {
    print('Ingresa el nombre del estudiante: ');
    String? nombre = stdin.readLineSync();

    if (nombre == "" || nombre == null){
      print('El nombre no puede estar vacío');
    }
    else{
      List<double> notas = [];
      while (true){
        print('Ingresa la nota (ENTER PARA SALIR)');
        String? nota = stdin.readLineSync();
        if(nota == ''){
          break;
        }
        else {
          try {

            if (nota == null){
              print('El valor ingresado no era un número');
            }
            else{
              double notaDouble = double.parse(nota);
              notas.add(notaDouble);
            }
          }
          on FormatException {
            print('El valor ingresado no era un número');
          }
        }
      }

      lista[nombre] = {'Notas' : notas};
      break;
    }
  }



}

void Mostrar(Map<String, Map<String, List<double>>> lista){

  print('LISTA DE ALUMNOS');
  for (MapEntry<String, Map<String, List<double>>> estudiante in lista.entries){

    String notas = '';
    for (List<double> listaDeNotas in estudiante.value.values){
      for (double nota in listaDeNotas){

        if (nota != listaDeNotas[listaDeNotas.length -1]){
          notas += '${nota.toString()}, ';
        }
        else {
          notas += '${nota.toString()}.';
        }


      }
    }


    print( '${estudiante.key} -> Notas: $notas');
  }


}


