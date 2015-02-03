String[] names = {"animal name", "hair", "feathers", "eggs", "milk", "airborne", "aquatic", "predator", "toothed", "backbone", "breathes", "venomous", "fins", "legs", "tail", "domestic", "catsize", "type"};
String[] types = {"String", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Numeric", "Boolean", "Boolean", "Boolean", "Numeric"};

Table zooData;
int i;
PrintWriter output;

void setup() {
  output = createWriter("zooDataForHumans.csv");
  
  zooData = loadTable("zoo.data.csv"); 
  output.println (names[0]+","+names[1]+","+names[2]+","+names[3]+","+names[4]+","+names[5]+","+names[6]+","+names[7]+","+names[8]+","+names[9]+","+names[10]+","+names[11]+","+names[12]+","+names[13]+","+names[14]+","+names[15]+","+names[16]+","+names[17]);
  
  for (TableRow rownum : zooData.rows()){
    for (i=0; i<=17; i++){
      if (types[i] == "String"){
        output.print (rownum.getString(i) + ",");
      } else if (types[i] == "Numeric"){
        if (i == 17){
          output.println (rownum.getInt(i));
        } else {
          output.print (rownum.getInt(i) + ",");
        }
      } else if (types[i] == "Boolean"){
        output.print (toBoolean(rownum.getInt(i)) + ",");
      } else{
        println ("Error with dataset");
      }
    }
  }
  output.close();
}
  
String toBoolean(int num){
  if (num == 1){
    return "true";
  } else { 
    return "false";
  }
}
