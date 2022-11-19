unit Brasil4D.Helper.JSON;

interface

uses
  System.JSON,
  Brasil4D.Helper.DateTime,
  Rest.JSON,
  System.Generics.Collections,
  System.SysUtils,
  System.StrUtils;

type
  TBrasil4DHelperJSONObject = class helper for TJSONObject
  public
    function ValueAsString(Name: string; Default: string = ''): string;
    function ValueAsInteger(Name: string; Default: Integer = 0): Integer;
    function ValueAsFloat(Name: string; Default: Double = 0): Double;
    function ValueAsDateTime(Name: string; AFormat: string = ''; Default: TDateTime = 0): TDateTime;
    function ValueAsBoolean(Name: string; Default: Boolean = True): Boolean;
    function ValueAsJSONObject(Name: string): TJSONObject;
    function ValueAsJSONArray(Name: string): TJSONArray;

    function SetValue(Name: string; Value: Boolean): TJSONObject; overload;
    function SetValue(Name: string; Value: Integer): TJSONObject; overload;
    function SetValue(Name: string; Value: Double): TJSONObject; overload;
    function SetValue(Name, Value: string): TJSONObject; overload;

    function Encode: string;
    class function FromString(Value: string): TJSONObject;
  end;

  TBrasil4DHelperJSONArray = class helper for TJSONArray
  private
    {$IF CompilerVersion <= 26.0}
    function GetItems(Index: Integer): TJSONValue;
    {$ENDIF}
  public
    {$IF CompilerVersion <= 26.0}
    function Count: Integer;
    property Items[Index: Integer]: TJSONValue read GetItems;
    {$ENDIF}

    function Encode: string;

    function ItemAsString(Index: Integer; Name: string; Default: string = ''): string;
    function ItemAsInteger(Index: Integer; Name: string; Default: Integer = 0): Integer;
    function ItemAsFloat  (Index: Integer; Name: string; Default: Double = 0): Double;
    function ItemAsDateTime(Index: Integer; Name: string; AFormat: string = ''; Default: TDateTime = 0): TDateTime;
    function ItemAsBoolean(Index: Integer; Name: string; Default: Boolean = True): Boolean;

    function ItemAsJSONObject(Index: Integer): TJSONObject; overload;
    function ItemAsJSONObject(Index: Integer; Name: string): TJSONObject; overload;
    function ItemAsJSONArray(Index: Integer): TJSONArray; overload;
    function ItemAsJSONArray(Index: Integer; Name: string): TJSONArray; overload;
    class function FromString(Value: string): TJSONArray;
  end;

implementation

{ TBrasil4DHelperJSONObject }

function TBrasil4DHelperJSONObject.SetValue(Name: string; Value: Boolean): TJSONObject;
begin
  Result := Self;
  if Value then
    Self.AddPair(Name, TJSONTrue.Create)
  else
    Self.AddPair(Name, TJSONFalse.Create)
end;

function TBrasil4DHelperJSONObject.Encode: string;
begin
  {$IF CompilerVersion > 26}
  Result := TJson.JsonEncode(Self);
  {$ELSE}
  Result := Self.ToString;
  {$ENDIF}
end;

class function TBrasil4DHelperJSONObject.FromString(Value: string): TJSONObject;
begin
  Result := nil;
  if Value.Trim.StartsWith('{') then
    Result := TJSONObject.ParseJSONValue(Value) as TJSONObject;
end;

function TBrasil4DHelperJSONObject.SetValue(Name: string; Value: Double): TJSONObject;
begin
  Result := Self;
  Self.AddPair(Name, TJSONNumber.Create(Value));
end;

function TBrasil4DHelperJSONObject.SetValue(Name: string; Value: Integer): TJSONObject;
begin
  Result := Self;
  Self.AddPair(Name, TJSONNumber.Create(Value));
end;

function TBrasil4DHelperJSONObject.SetValue(Name, Value: string): TJSONObject;
begin
  Result := Self;
  Self.AddPair(Name, TJSONString.Create(Value));
end;

function TBrasil4DHelperJSONObject.ValueAsBoolean(Name: string; Default: Boolean): Boolean;
var
  strValue: string;
begin
  Result := Default;
  if GetValue(Name) <> nil then
  begin
    strValue := GetValue(Name).ToString;
    Result := not strValue.Equals('false');
  end;
end;

function TBrasil4DHelperJSONObject.ValueAsDateTime(Name, AFormat: string; Default: TDateTime): TDateTime;
var
  strValue: string;
begin
  Result := Default;
  strValue := ValueAsString(Name, '0');
  strValue := Trim(Copy(strValue, 1, 19));
  Result.fromIso8601ToDateTime(strValue);
end;

function TBrasil4DHelperJSONObject.ValueAsFloat(Name: string; Default: Double): Double;
var
  strValue: string;
begin
  strValue := ValueAsString(Name, Default.ToString);
  {$IF CompilerVersion >= 35.0}
  Result := StrToFloatDef(strValue.Replace('.', FormatSettings.DecimalSeparator), Default);
  {$ELSE}
  Result := StrToFloatDef(strValue, Default);
  {$ENDIF}
end;

function TBrasil4DHelperJSONObject.ValueAsInteger(Name: string; Default: Integer): Integer;
var
  strValue: string;
begin
  strValue := ValueAsString(Name, default.ToString);
  Result := StrToIntDef(strValue, Default);
end;

function TBrasil4DHelperJSONObject.ValueAsJSONArray(Name: string): TJSONArray;
begin
  Result := nil;
  if GetValue(Name) is TJSONArray then
    Result := TJSONArray( GetValue(Name) );
end;

function TBrasil4DHelperJSONObject.ValueAsJSONObject(Name: string): TJSONObject;
begin
  Result := nil;
  if GetValue(Name) is TJSONObject then
    Result := TJSONObject( GetValue(Name) );
end;

function TBrasil4DHelperJSONObject.ValueAsString(Name, Default: string): string;
begin
  Result := Default;
  if GetValue(Name) <> nil then
    Result := GetValue(Name).Value;

  Result := Result.Replace(#$A, ' | ');

//  {$IF CompilerVersion < 30.0}
//  Result := UTF8ToString(Result);
//  {$ENDIF}
end;

{ TBrasil4DHelperJSONArray }

{$IF CompilerVersion <= 26.0}
function TBrasil4DHelperJSONArray.Count: Integer;
begin
  Result := Self.Size;
end;
{$ENDIF}

function TBrasil4DHelperJSONArray.Encode: string;
begin
  {$IF CompilerVersion > 26}
  Result := TJson.JsonEncode(Self);
  {$ELSE}
  Result := Self.ToString;
  {$ENDIF}
end;

class function TBrasil4DHelperJSONArray.FromString(Value: string): TJSONArray;
begin
  Result := nil;
  if Value.Trim.StartsWith('[') then
    Result := TJSONObject.ParseJSONValue(Value) as TJSONArray;
end;

{$IF CompilerVersion <= 26.0}
function TBrasil4DHelperJSONArray.GetItems(Index: Integer): TJSONValue;
begin
  {$IF CompilerVersion > 26.0}
  Result := Self.Items[Index];
  {$ELSE}
  Result := Self.Get(Index);
  {$ENDIF}
end;
{$ENDIF}

function TBrasil4DHelperJSONArray.ItemAsBoolean(Index: Integer; Name: string; Default: Boolean): Boolean;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  Result := json.ValueAsBoolean(Name, Default);
end;

function TBrasil4DHelperJSONArray.ItemAsDateTime(Index: Integer; Name, AFormat: string; Default: TDateTime): TDateTime;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  Result := json.ValueAsDateTime(Name, AFormat, Default);
end;

function TBrasil4DHelperJSONArray.ItemAsFloat(Index: Integer; Name: string; Default: Double): Double;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  Result := json.ValueAsFloat(Name, Default);
end;

function TBrasil4DHelperJSONArray.ItemAsInteger(Index: Integer; Name: string; Default: Integer): Integer;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  Result := json.ValueAsInteger(Name, Default);
end;

function TBrasil4DHelperJSONArray.ItemAsJSONArray(Index: Integer): TJSONArray;
begin
  Result := {$IF CompilerVersion > 26.0} Items[Index] as TJSONArray; {$ELSE} Self.Get(Index) as TJSONArray; {$ENDIF}
end;

function TBrasil4DHelperJSONArray.ItemAsJSONArray(Index: Integer; Name: string): TJSONArray;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  Result := json.ValueAsJSONArray(Name);
end;

function TBrasil4DHelperJSONArray.ItemAsJSONObject(Index: Integer; Name: string): TJSONObject;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  Result := json.ValueAsJSONObject(Name);
end;

function TBrasil4DHelperJSONArray.ItemAsJSONObject(Index: Integer): TJSONObject;
begin
  Result := {$IF CompilerVersion > 26.0} Items[Index] as TJSONObject; {$ELSE} Self.Get(Index) as TJSONObject; {$ENDIF}
end;

function TBrasil4DHelperJSONArray.ItemAsString(Index: Integer; Name, Default: string): string;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  Result := json.ValueAsString(Name, Default);
end;

end.


