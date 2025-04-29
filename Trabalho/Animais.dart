import 'Animal.dart';
import 'Galinha.dart';
import 'Vaca.dart';

void main(){

  Animal minhaVaca = Vaca();
  Animal minhaGalinha = Galinha();

  minhaVaca.fazerSom();// Saida "Muuu"
  minhaGalinha.fazerSom();//Saida "Pó, Pó"
  
}