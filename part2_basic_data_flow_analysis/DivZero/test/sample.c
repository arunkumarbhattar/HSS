void f() {
  int x = 0;
  int y = 2;
  int z;
  if (x < 1) {
    y = 1;
  }
  else if (x >100)
  {
	z = 10/x;
  }
  else
  	z = y / x; // divide-by-zero after branch
   z =  y/x;
}
