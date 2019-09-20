unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TMainForm = class(TForm)
    CalculateButton: TButton;
    ExitButton: TButton;
    te: TEdit;
    label1: TLabel;
    BGImg: TImage;
    progr: TProgressBar;
    PaintBox1: TPaintBox;


    procedure Greed;
    procedure FormCreate(Sender: TObject);
    procedure CalculateButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  startColor:TColor;



implementation

{$R *.dfm}

procedure TMainForm.Greed;
var y,x,n,i,j:integer;
  dx,dy,value:integer;
  sstr:string;
  start:Trect;

begin
  {BGImg.Picture:=nil;}


  x:=569;
  y:=505;
  dx:=60;
  dy:=15;
  start.TopLeft.X:=Round(x/2)-3+11;
  start.TopLeft.Y:=Round(y/2)+3-10;
  start.BottomRight.X:=Round(x/2)+3+11;
  start.BottomRight.Y:=Round(y/2)-3-10;
  BGImg.Canvas.Font.Name:='MS Sans Serif';

with BGImg.Canvas do
begin
  Pen.Color:=clBlack;
  Ellipse(start);
  MoveTo(dy,20);
  LineTo(dy,BGImg.Height-dx+35);
  Moveto(dy-5,BGImg.Height-dx+35);
  Lineto(BGImg.Width-10,BGImg.Height-dx+35);
  n:=40;
  j:=1;
  i:=-6;
  sstr:='';
  while j*n<BGImg.Width-2*dy do
  begin
   Pen.Color:=clRed;
   Moveto(j*n+15,BGImg.Height-dx+37);
   Lineto(j*n+15,60);
   value:=i;
   Str(value:10,sstr);
   TextOut(j*n-15,BGImg.Height-dx+40,sstr);
   inc(j);
   Inc(i);
  end;

  j:=1;
  i:=-5;
  while j*n<BGImg.Height-dx-40 do
  begin
   pen.Color:=clRed;
   moveto(BGImg.Width-dy,BGImg.Height-dx+35-j*n);
   lineto(dy,BGImg.Height-dx+35-j*n);
   value:=i;
   Str(value:4,sstr);
   TextOut(3,BGImg.Height-dx+35-j*n-3,sstr);
   inc(j);inc(i);
  end;
 end;
 PaintBox1.Canvas.Brush.Color:=clWhite;
 PaintBox1.Canvas.Rectangle(PaintBox1.ClientRect);
 with PaintBox1.Canvas do
begin
  Pen.Color:=clBlack;
  Ellipse(start);
  MoveTo(dy,20);
  LineTo(dy,BGImg.Height-dx+35);
  Moveto(dy-5,BGImg.Height-dx+35);
  Lineto(BGImg.Width-10,BGImg.Height-dx+35);
  n:=40;
  j:=1;
  i:=-6;
  sstr:='';
  while j*n<BGImg.Width-2*dy do
  begin
   Pen.Color:=clRed;
   Moveto(j*n+15,BGImg.Height-dx+37);
   Lineto(j*n+15,60);
   value:=i;
   Str(value:10,sstr);
   TextOut(j*n-15,BGImg.Height-dx+40,sstr);
   inc(j);
   Inc(i);
  end;

  j:=1;
  i:=-5;
  while j*n<BGImg.Height-dx-40 do
  begin
   pen.Color:=clRed;
   moveto(BGImg.Width-dy,BGImg.Height-dx+35-j*n);
   lineto(dy,BGImg.Height-dx+35-j*n);
   value:=i;
   Str(value:4,sstr);
   TextOut(3,BGImg.Height-dx+35-j*n-3,sstr);
   inc(j);inc(i);
  end;
 end;
 BGImg.Canvas.Brush.Style:=bsClear;
 BGImg.Canvas.Rectangle(BGImg.ClientRect);

end;


procedure TMainForm.ExitButtonClick(Sender: TObject);
begin
close;
end;



procedure TMainForm.FormCreate(Sender: TObject);
begin
  Greed;
end;


procedure TMainForm.CalculateButtonClick(Sender: TObject);
const
 k=1.38e-23;
 Na=6.022e23;
var
  btm:TBitmap;
  Tim,N: longint;
  T,dya,sign,xold,yold: integer;
  x2,P,vx_gas,mu_g,mgmb,SpeedX,SpeedY,
  dt,dt1,x,y,x0,Mb,time,val:real;
  sstr: string;

  begin

  Randomize;
  DecimalSeparator:='.';
  progr.Position:=0;
  time:=StrToFloat(te.Text)*1e-3;


  BGImg.Picture:=nil;Greed;

  btm:=TBitmap.Create;
  btm.Height:=PaintBox1.Height;
  btm.Width:=PaintBox1.Width;


  mu_g:=0.04;
  Mb:=1e-20;
  T:=300;
  P:=20000;
  dt:=0.5*sqrt(2*pi*mu_g*k*T)/sqrt(6.02e23)/(P*4*sqr(0.02e-6))*10;{c *10dt};
  dt1:=dt*1e6*50;
  vx_gas:=sqrt(8.31*T/mu_g);
  mgmb:=2*mu_g/6.02*1e-23/mb;
  { dxa:=60;} dya:=16;
 x:=569; x0:=x;
 y:=505-dya-4;{y0:=y;}



 with PaintBox1.Canvas  do
 begin

  SpeedX:=sqrt(k*T/mb);
  SpeedY:=sqrt(k*T/mb);
  N:=0;
  tim:=Round(time/dt);

  x:=Round(x/2)+10;
  y:=Round(y/2);
  xold:=Round(x);
  yold:=Round(y);

  while N <= tim do
  begin
   inc(N);

   if Random>0.5 then sign:=+1 else sign:=-1;
   SpeedX:=SpeedX+(sign*vx_gas-SpeedX)*mgmb*random*4;
   if Random>0.5 then sign:=+1 else sign:=-1;
   SpeedY:=SpeedY+(sign*vx_gas-SpeedY)*mgmb*random*4;
   x:=x+dt1*SpeedX * 0.5;
   y:=y+dt1*SpeedY * 0.5;
   {}
   if (xold <> Round(x)) or (yold <> Round(y)) then
   begin
     xold:=Round(x);yold:=Round(y);
     Pixels[xold,yold]:=clBlack;
     btm.Canvas.Pixels[xold,yold]:=clBlack;
   end;
   progr.Position:=round(N/Tim*1000);
  end;
  x2:=(x-x0)*(x-x0)/2500*0.01;
  val:=N*dt;


{  PrintData; }



 end;
 BGImg.Picture.Assign(btm);
 Greed;
   {************}
   with BGImg.Canvas do
   begin
  TextOut(Width-100,490,'mkm');
  str(val:10,sstr);
  TextOut(190,10, 'Time = '+sstr+' sec');

  val:=dt;
  str(val:15,sstr);
  TextOut(60,10,'dt = '+sstr+' sec');

  val:=vx_gas;
  str(val:10,sstr);
  TextOut(60,30,'V im = '+sstr+' m/sec');

  val:=P/T/1.38*1e23;
  str(val:10,sstr);
  TextOut(60,50,'n2 = '+sstr+' 1/m^2');

  val:=x2;
  str(val:10,sstr);
  TextOut(190,30, 'X^2 = '+sstr+' mkm^2');

  end;
  {************}


  btm.Free;

end;



end.
