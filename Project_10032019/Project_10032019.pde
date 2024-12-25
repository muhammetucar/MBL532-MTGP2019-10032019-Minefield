
int sayilar[][] = new int [10] [10];  //10x10 luk bir Array(Dizi)-Matris oluşturuyor. İçinde henüz bir değer yok.

PFont benimFontum;

void setup ()
{
  size(500, 500);
  background(255);

  //  benimFontum = loadFont("AdobeFanHeitiStd-Bold-48.vlw");
  //  textFont(benimFontum, 16);

  /*  Bu kısma gerek yok bombalanın içinde zaten aynı kod var
   for (int i = 1; i < 9; i++)
   {
   for (int j = 1; j < 9; j++)
   {
   sayilar [i][j] =  0;        //8x8 lik diziye [1,1] den [8,8]'e kadar 0 değerini atıyor.
   }
   }
   */
}




void draw()
{
  //background(255);
  cizdir();
}






void keyPressed()
{
  if ((keyCode == 'r') || (keyCode == 'R'))     //Klavyeden r veya R tuşuna basılınca bombala() fonksiyonunu çalıştırıyor.
  {
    bombala();
  }
}





void bombala()
{
  int sayac = 10;
  int XX = 0;
  int YY = 0;

  for (int i = 1; i < 9; i++)
  {
    for (int j = 1; j < 9; j++)
    {
      sayilar [i][j] =  0;             //8x8 lik diziye [1,1] den [8,8]'e kadar 0 değerini atıyor.
    }
  }

  while (sayac>0)
  {
    XX = int(random(1, 9));  //Rastgele bomba üretmek için X koordinatı üretiyor
    YY = int(random(1, 9));  //Rastgele bomba üretmek için Y koordinatı üretiyor

    sayilar[XX][YY] = -1;
    sayac--;

    
    for (int i = 1; i < 9; i++)    //i=1'den i=8'e kadar döngü oluşturur
    {
      for (int j = 1; j < 9; j++)  //j=1'den j=8'e kadar döngü oluşturur
      {
        if (sayilar [i][j] != -1)  //[1,1]'den [8,8]'e kadar -1 değilse aşağıdaki kontrolü yapar
        {

          for (int x = -1; x <2; x++)
          {
            for (int y = -1; y <2; y++)
            {
               sayilar [XX+x][YY+y] = 1;   //Bombanın etrafına 1 değeri atar
            }
      }
          sayilar [XX][YY] = -1;          //Bombayı günceller. sayilar [XX+x][YY+y] = -1; ile 1 değeri atandığı için tekrar -1 atayarak bomba olmasını sağlar

        }
      }
    }
  }
}



void cizdir()
{
  for (int j = 0; j < 10; j++)
  {
    for (int i = 0; i < 10; i++)
    {
      if (sayilar [i][j] == 0)
      { 
        fill(255, 255, 0);
      } else if (sayilar [i][j] == -1)
      {
        fill (20, 20, 20);
      } else if (sayilar [i][j] == 1)
      {
        fill (245, 64, 70);
      } else if (sayilar [i][j] == 2)
      {
        fill (144, 1, 6);
      } else if (sayilar [i][j] == 3)
      {
        fill (8, 50, 255);
      } else if (sayilar [i][j] == 4)
      {
        fill (255, 8, 198);
      } else 
      {
        fill ( 250, 164, 50);
      }
      rect(i*50, j*50, 45, 45);

      
      
      if (sayilar[i][j] != -1)    //-1 olmayan yerlere, yani bomba olmayan yerlere [i,j] değerlerini yazdırır
      {
        fill(0);
        //textFont(benimFontum, 20);
        text(sayilar[i][j], i*50+20, j*52+20 );
      } 
      
      
      
      if (sayilar[i][j] == -1)   //-1 olan yerlere BOMBA yazdırır
      {
        fill(255);
        text("BOMBA", i*50+2, j*52 + 20);    //-1 yani bomba olan hücreye BOMBA yazısını yazdırır
      }
      
      
      
    }
  }
}
