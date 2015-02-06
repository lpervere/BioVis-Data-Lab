// Leah Pervere
// Lab 2: Data Parsing and Manipulation
// BCB 4002
// 1/30/2015-2/6/2015

// Note: to run properly, the zoo.data file must be added to the sketch. (Menu: Sketch --> Add File)
// The file has already been included in the data folder for the assignment submission.

//Creates arrays of strings to store the data names and their types
String[] names = {"animal name", "hair", "feathers", "eggs", "milk", "airborne", "aquatic", "predator", "toothed", "backbone", "breathes", "venomous", "fins", "legs", "tail", "domestic", "catsize", "type"};
String[] types = {"String", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Numeric", "Boolean", "Boolean", "Boolean", "Numeric"};

// Initializes variables for the table that will store the data and the writer that will output it
Table zooData;
PrintWriter output;

void setup() {
  // Tells program to output newly-formatted data to given filename
  output = createWriter("zooDataForHumans.csv");
  
  // Loads the data and prints the header
  zooData = loadTable("zoo.data.csv"); 
  output.println (names[0]+","+names[1]+","+names[2]+","+names[3]+","+names[4]+","+names[5]+","+names[6]+","+names[7]+","+names[8]+","+names[9]+","+names[10]+","+names[11]+","+names[12]+","+names[13]+","+names[14]+","+names[15]+","+names[16]+","+names[17]);
  
  // Iterates through the rows of the table
  for (TableRow rownum : zooData.rows()){
    for (int i=0; i<=17; i++){
      
      // If it's a string, print the string
      if (types[i] == "String"){
        output.print (rownum.getString(i) + ",");
        
      // If it's a numeric value...
      } else if (types[i] == "Numeric"){
        
        // ... AND it's the last one in the data set, print the value without a comma after it
        if (i == 17){
          output.println (rownum.getInt(i));
        // If it's not the last one, print the value with a comma
        } else {
          output.print (rownum.getInt(i) + ",");
        }
      
      // If it's a boolean, get the value (0 or 1), call toBoolean, and print the result followed by a comma
      } else if (types[i] == "Boolean"){
        output.print (toBoolean(rownum.getInt(i)) + ",");
        
      // If the above code does not cover every value in the data set, it is not the correct zoo.data file
      } else{
        println ("Error with dataset");
      }
    }
  }
  // Close the writer (end the file)
  output.close();
}

// If the boolean value is 1, return true; if it's 0, return false.
String toBoolean(int num){
  if (num == 1){
    return "true";
  } else { 
    return "false";
  }
}
