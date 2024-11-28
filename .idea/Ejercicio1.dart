import 'dart:io';

// USO DE SET()
void main(){

  var generosMusicales = <String>{};
  bool ciclo = true;
  while (ciclo) {
      print('Ingresa un género (ENTER para salir y 0 para mostrar la lista): ');
      String? genero = stdin.readLineSync();
      if (genero == '') {
        print('Adios');
        break;
      }
      else if (genero == '0'){
        print('LISTA DE GÉNEROS:');
        for (String genero in generosMusicales){
          print(genero);
        }
        break;
      }
      else{
        if(generosMusicales.length < 5 && genero != null){
          generosMusicales.add(genero);
        }
        else if (genero == null){
          print('El género no puede ser nulo.');
        }
        else{
          print('La lista de géneros ya está llena.');
        }
      }
  }

}