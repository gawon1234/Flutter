
void main(){
  performTasks();
}

void performTasks() async{
  task1();
  int res = await tasks2();
  tasks3(res);
}

void task1(){
  print('task1 done');
}

Future tasks2 () async{ //  same with Future<int>
  Duration three = Duration(seconds: 3);

  int result;
  await Future.delayed(three, () {
    result = 120;
    print('task2 done');
  });

  return result;
}

void tasks3(int task2data){
  //String result = 'task3 data';
  print('task3 done ' + task2data.toString() );
}