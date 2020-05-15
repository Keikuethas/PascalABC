uses GraphABC;
var
selectedChest:integer;

const
//Сколько карт:
bcHowManycwh = 6; //Как много карт в папке bc (Как много у нас есть базовых карт) 
wcHowManycwh = 1;    //Как много карт в папке wc (Как много у нас есть ведьминых карт)
//Сколько в сундуках:
bcHowMany = 15; //как много карт в сундуке
wcHowMany = 6; 

procedure selectChest(x,y,mb:integer);
begin
  if (y<201) then
    if (x<201) then selectedChest:=1 else
      if x.InRange(200,400) then selectedChest:=2;
end;
begin
  randomize();
  OnMouseUp:=selectChest;
  window.Maximize;
  repeat
    var cp:=new Picture('bcf0.png');
    cp.draw;
    cp:=new Picture('wcf0.png');
    cp.Draw(200,0);;
    
  while selectedChest=0 do
  begin
  end;
  clearwindow;
  case selectedChest of
    1:
    begin
      var nowFrame:Picture;
      for var i:=0 to 6 do
      begin
        nowFrame:=new Picture('bcf'+i.ToString+'.png');
        nowFrame.Draw(window.Center.X-100,window.Center.Y-100);
        sleep(100);
      end;
      var leftCards:=bcHowMany;
      var i:=0;
      while leftCards>0 do
      begin
          nowFrame:=new Picture('bc/c'+random(0,bcHowManycwh-1).ToString+'.png');
          nowFrame.Draw(200*i,0);
          var hmd:=random(1,leftCards);
          leftCards-=hmd;
          textout(200*(i+1)-40,160,hmd);
          i+=1;
          sleep(500);
        end;
        
      end;
      2:
      begin
              var nowFrame:Picture;
      for var i:=0 to 6 do
      begin
        nowFrame:=new Picture('wcf'+i.ToString+'.png');
        nowFrame.Draw(window.Center.X-100,window.Center.Y-100);
        sleep(100);
      end;
      var leftCards:=wcHowMany;
      var i:=0;
      while leftCards>0 do
      begin
          nowFrame:=new Picture('wc/c'+random(0,wcHowManycwh-1).ToString+'.png');
          nowFrame.Draw(200*i,0);
          var hmd:=random(1,leftCards);
          leftCards-=hmd;
          textout(200*(i+1)-40,160,hmd);
          i+=1;
          sleep(500);
        end;
      end;
      end;
    sleep(5000);
    clearwindow;
  selectedChest:=0;
  until false;
end.