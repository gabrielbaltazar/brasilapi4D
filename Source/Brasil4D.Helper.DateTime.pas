unit Brasil4D.Helper.DateTime;

interface

uses
  System.SysUtils,
  System.TimeSpan,
  System.DateUtils;

type
  TBrasil4DHelperDateTime = record helper for TDateTime
  private
    function Iso8601ToDateTime(AValue: string): TDateTime;
  public
    function DateTimeToIso8601: string;
    function Format(ADateFormat: string): string;
    function ConverterDataLocal: TDateTime;
    function FormatYYYY_MM_DD: string;
    procedure fromIso8601ToDateTime(AValue: string);
  end;

implementation

{ TBrasil4DHelperDateTime }

function TBrasil4DHelperDateTime.ConverterDataLocal: TDateTime;
var
  LUTC: Integer;
begin
  LUTC := TTimeZone.Local.GetUtcOffset(Now).Hours;
  Result := IncHour(Self, LUTC);
end;

function TBrasil4DHelperDateTime.DateTimeToIso8601: string;
begin
  if Self = 0 then
    Result := ''
  else
  if Frac(Self) = 0 then
    Result := FormatDateTime('yyyy"-"mm"-"dd', Self)
  else
  if Trunc(Self) = 0 then
    Result := FormatDateTime('"T"hh":"nn":"ss', Self)
  else
    Result := FormatDateTime('yyyy"-"mm"-"dd"T"hh":"nn":"ss', Self);
end;

function TBrasil4DHelperDateTime.Format(ADateFormat: string): string;
begin
  Result := FormatDateTime(ADateFormat, Self);
end;

function TBrasil4DHelperDateTime.FormatYYYY_MM_DD: string;
begin
  Result := Format('yyyy-MM-dd');
end;

procedure TBrasil4DHelperDateTime.fromIso8601ToDateTime(AValue: string);
begin
  Self := Iso8601ToDateTime(AValue);
end;

function TBrasil4DHelperDateTime.Iso8601ToDateTime(AValue: string): TDateTime;
var
  Y, M, D, HH, MI, SS: Cardinal;
begin
  // YYYY-MM-DD   Thh:mm:ss  or  YYYY-MM-DDThh:mm:ss
  // 1234567890   123456789      1234567890123456789

  //{"$date":"2019-08-24T11:08:13.000-03:00"} // Data no Mongo
  AValue := AValue.Replace('{"$date":"', '').Replace('"}', '');

  Result := 0;
  case Length(AValue) of
    9:
      if (AValue[1] = 'T') and (AValue[4] = ':') and (AValue[7] = ':') then
      begin
        HH := Ord(AValue[2]) * 10 + Ord(AValue[3]) - (48 + 480);
        MI := Ord(AValue[5]) * 10 + Ord(AValue[6]) - (48 + 480);
        SS := Ord(AValue[8]) * 10 + Ord(AValue[9]) - (48 + 480);
        if (HH < 24) and (MI < 60) and (SS < 60) then
          Result := EncodeTime(HH, MI, SS, 0);
      end;
    10:
      if (AValue[5] = AValue[8]) and (Ord(AValue[8]) in [Ord('-'), Ord('/')]) then
      begin
        Y := Ord(AValue[1]) * 1000 + Ord(AValue[2]) * 100 + Ord(AValue[3]) * 10 + Ord(AValue[4]) - (48 + 480 + 4800 + 48000);
        M := Ord(AValue[6]) * 10 + Ord(AValue[7]) - (48 + 480);
        D := Ord(AValue[9]) * 10 + Ord(AValue[10]) - (48 + 480);
        if (Y <= 9999) and ((M - 1) < 12) and ((D - 1) < 31) then
          Result := EncodeDate(Y, M, D);
      end;
    19,20,21,22,23,24,25,26,27,28,29:
      if (AValue[5] = AValue[8]) and
         (Ord(AValue[8]) in [Ord('-'), Ord('/')]) and
         (Ord(AValue[11]) in [Ord(' '), Ord('T')]) and
         (AValue[14] = ':') and
         (AValue[17] = ':') then
      begin
        Y := Ord(AValue[1]) * 1000 + Ord(AValue[2]) * 100 + Ord(AValue[3]) * 10 + Ord(AValue[4]) - (48 + 480 + 4800 + 48000);
        M := Ord(AValue[6]) * 10 + Ord(AValue[7]) - (48 + 480);
        D := Ord(AValue[9]) * 10 + Ord(AValue[10]) - (48 + 480);
        HH := Ord(AValue[12]) * 10 + Ord(AValue[13]) - (48 + 480);
        MI := Ord(AValue[15]) * 10 + Ord(AValue[16]) - (48 + 480);
        SS := Ord(AValue[18]) * 10 + Ord(AValue[19]) - (48 + 480);
        if (Y <= 9999) and ((M - 1) < 12) and ((D - 1) < 31) and (HH < 24) and (MI < 60) and (SS < 60) then
          Result := EncodeDate(Y, M, D) + EncodeTime(HH, MI, SS, 0);
      end;
  end;
end;

end.


