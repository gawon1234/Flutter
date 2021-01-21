
class CalculatorBrain{
  final int height;
  final int weight;

  CalculatorBrain(this.height, this.weight){

    return CalculateBMI().toString();

  };

  String CalculateBMI(){

    double bmi;
    bmi= this.weight / pow(this.height / 100, 2);


    if(bmi > 25)
      return "Level B";
    else
      return "normal";


  }



}