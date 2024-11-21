
class Capicua
{
  bool esCapicua(int numeroVerificar)
  {
    if (numeroVerificar < 10000 || numeroVerificar > 99999) {
      throw ArgumentError("No es un número de 5 digitos");
    }
    String numeroString=numeroVerificar.toString();

    //logica para comprobar si es un copicua en el cual primero separo los caracteres en lista
    //luego invierto el orden con reversed y despues uno para comprobar con  numeroString
    return  numeroString==numeroString.split('').reversed.join();
  }
}
