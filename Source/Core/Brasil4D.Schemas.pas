unit Brasil4D.Schemas;

interface

uses
  Brasil4D.Helper.JSON,
  System.Generics.Collections,
  System.JSON,
  System.SysUtils;

type
  TBrasil4DSchema = class
  protected
    procedure FromJSONObject(AJSONObject: TJSONObject); virtual; abstract;
  public
    class function FromJSONArray<T: TBrasil4DSchema, constructor>
      (AJSONArray: TJSONArray): TObjectList<T>;
  end;

implementation

{ TBrasil4DSchema }

class function TBrasil4DSchema.FromJSONArray<T>(AJSONArray: TJSONArray): TObjectList<T>;
var
  I: Integer;
begin
  Result := TObjectList<T>.Create;
  try
    if Assigned(AJSONArray) then
      for I := 0 to Pred(AJSONArray.Count) do
      begin
        Result.Add(T.Create);
        Result.Last.FromJSONObject(AJSONArray.ItemAsJSONObject(I));
      end;
  except
    Result.Free;
    raise;
  end;
end;

end.
