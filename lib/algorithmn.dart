List modsandslot = [];
List mods = [2, 1, 3, 4, 5];
List slots = ['B', 'A', 'C', 'D'];
List newmodule = [];

//want [1A,2A,3A,4A,5A,5B,4B,3B,2B,1B,1C,2C,3C,4C,5C,5D,4D,3D,2D,1D]

//ACTUAL//
void main() {
  //However this only works if its in the mods and slots above
  mods.sort(); //According to the integer
  slots.sort(); //According to alphabet
  print(mods);
  print(slots);
  for (var i = 0; i < slots.length; i++) {
    // from 1 to 4, so A- 1,5 then B, 5-1,, then C-1,5 then D, 5-1 //SLOTS
    for (var j = 0; j < mods.length; j++) {
      //MODS
      if (i % 2 == 0) {
        //if even
        modsandslot.add(mods[j].toString() + slots[i]);
      } else {
        modsandslot.add(mods.reversed.toList()[j].toString() + slots[i]);
        print(mods);
      }
    }
  }
  print(modsandslot);
}
