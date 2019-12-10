#define MAX 5
#define DIM 5
byte a[DIM];

init{
    byte b;
    select(b : 1 .. MAX);
    }

proctype straznik(byte value1; byte value2){
    byte temp;
    temp=value2;
    value2=value1;
    value1=temp;
}

proctype watch_neighbour(){
    int index=0;
    do
    :: index==MAX-1 -> break
    :: a[index] > a[index+1] -> straznik(a[index];a[index+1]); index++;
    od
}

proctype active main(){
    print(a);
    watch_neighbour();
    print(a);
}