unit Brasil4D.ISBN.Schemas;

interface

uses
  Brasil4D.Schemas,
  Brasil4D.Helper.JSON,
  System.Generics.Collections,
  System.JSON,
  System.SysUtils;

type
  TBrasil4DISBNUnit = (tuCentimeter, tuInch);

  TBrasil4DISBNFormat = (tfPhysical, tfDigital);

  TBrasil4DISBNProvider = (tpCbl, tpMercadoEditorial, tpOpenLibrary, tpGoogleBooks);

  TBrasil4DISBNSchemaDimensions = class;
  TBrasil4DISBNSchemaPrice = class;

  TBrasil4DISBNSchema = class(TBrasil4DSchema)
  private
    FISBN: string;
    FTitle: string;
    FSubtitle: string;
    FAuthors: TList<string>;
    FPublisher: string;
    FSynopsis: string;
    FYear: Integer;
    FPageCount: Integer;
    FLocation: string;
    FCoverUrl: string;
    FDimensions: TBrasil4DISBNSchemaDimensions;
    FFormat: TBrasil4DISBNFormat;
    FProvider: TBrasil4DISBNProvider;
    FRetailPrice: TBrasil4DISBNSchemaPrice;
    FSubjects: TList<string>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property ISBN: string read FISBN write FISBN;
    property Title: string read FTitle write FTitle;
    property Subtitle: string read FSubtitle write FSubtitle;
    property Authors: TList<string> read FAuthors write FAuthors;
    property Publisher: string read FPublisher write FPublisher;
    property Synopsis: string read FSynopsis write FSynopsis;
    property Year: Integer read FYear write FYear;
    property PageCount: Integer read FPageCount write FPageCount;
    property Location: string read FLocation write FLocation;
    property CoverUrl: string read FCoverUrl write FCoverUrl;
    property Dimensions: TBrasil4DISBNSchemaDimensions read FDimensions write FDimensions;
    property Format: TBrasil4DISBNFormat read FFormat write FFormat;
    property RetailPrice: TBrasil4DISBNSchemaPrice read FRetailPrice write FRetailPrice;
    property Provider: TBrasil4DISBNProvider read FProvider write FProvider;
    property Subjects: TList<string> read FSubjects write FSubjects;
  end;

  TBrasil4DISBNSchemaDimensions = class(TBrasil4DSchema)
  private
    FWidth: Double;
    FHeight: Double;
    FUnit: TBrasil4DISBNUnit;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Width: Double read FWidth write FWidth;
    property Height: Double read FHeight write FHeight;
    property &Unit: TBrasil4DISBNUnit read FUnit write FUnit;
  end;

  TBrasil4DISBNSchemaPrice = class(TBrasil4DSchema)
  private
    FCurrency: string;
    FAmount: Double;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;
    procedure Clear;

    property Currency: string read FCurrency write FCurrency;
    property Amount: Double read FAmount write FAmount;
  end;

  TBrasil4DISBNProviderHelper = record helper for TBrasil4DISBNProvider
  public
    function ToString: string;
    procedure FromString(AValue: string);
  end;

implementation

{ TBrasil4DISBNSchemaPrice }

procedure TBrasil4DISBNSchemaPrice.Clear;
begin
  FCurrency := EmptyStr;
  FAmount := 0;
end;

procedure TBrasil4DISBNSchemaPrice.FromJSONObject(AJSONObject: TJSONObject);
begin
  if Assigned(AJSONObject) then
  begin
    FCurrency := AJSONObject.ValueAsString('currency');
    FAmount := AJSONObject.ValueAsFloat('amount');
  end;
end;

{ TBrasil4DISBNSchemaDimensions }

procedure TBrasil4DISBNSchemaDimensions.FromJSONObject(AJSONObject: TJSONObject);
begin
  FWidth := AJSONObject.ValueAsFloat('width');
  FHeight := AJSONObject.ValueAsFloat('height');
  FUnit := tuCentimeter;

  if AJSONObject.ValueAsString('unit').ToLower = 'inch' then
    FUnit := tuInch;
end;

{ TBrasil4DISBNSchema }

constructor TBrasil4DISBNSchema.Create;
begin
  FAuthors := TList<string>.Create;
  FDimensions := TBrasil4DISBNSchemaDimensions.Create;
  FRetailPrice := TBrasil4DISBNSchemaPrice.Create;
  FSubjects := TList<string>.Create;
end;

destructor TBrasil4DISBNSchema.Destroy;
begin
  FAuthors.Free;
  FDimensions.Free;
  FRetailPrice.Free;
  FSubjects.Free;
  inherited;
end;

procedure TBrasil4DISBNSchema.FromJSONObject(AJSONObject: TJSONObject);
var
  LJSONArray: TJSONArray;
  I: Integer;
begin
  FAuthors.Clear;
  FSubjects.Clear;

  FISBN := AJSONObject.ValueAsString('isbn');
  FTitle := AJSONObject.ValueAsString('title');
  FSubtitle := AJSONObject.ValueAsString('subtitle');
  FPublisher := AJSONObject.ValueAsString('publisher');
  FSynopsis := AJSONObject.ValueAsString('synopsis');
  FYear := AJSONObject.ValueAsInteger('year');
  FPageCount := AJSONObject.ValueAsInteger('page_count');
  FLocation := AJSONObject.ValueAsString('location');
  FCoverUrl := AJSONObject.ValueAsString('cover_url');
  FProvider.FromString(AJSONObject.ValueAsString('provider'));
  FRetailPrice.FromJSONObject(AJSONObject.ValueAsJSONObject('reatil_price'));

  FFormat := tfPhysical;
  if AJSONObject.ValueAsString('format').ToUpper = 'DIGITAL' then
    FFormat := tfDigital;

  LJSONArray := AJSONObject.ValueAsJSONArray('authors');
  if Assigned(LJSONArray) then
  begin
    for I := 0 to Pred(LJSONArray.Count) do
      FAuthors.Add(LJSONArray.Items[I].Value);
  end;

  LJSONArray := AJSONObject.ValueAsJSONArray('subjects');
  if Assigned(LJSONArray) then
  begin
    for I := 0 to Pred(LJSONArray.Count) do
      FSubjects.Add(LJSONArray.Items[I].Value);
  end;
end;

{ TBrasil4DISBNProviderHelper }

procedure TBrasil4DISBNProviderHelper.FromString(AValue: string);
begin
  Self := tpCbl;
  if AValue.ToLower = 'mercado-editorial' then
    Self := tpMercadoEditorial;
  if AValue.ToLower = 'open-library' then
    Self := tpOpenLibrary;
  if AValue.ToLower = 'google-books' then
    Self := tpGoogleBooks;
end;

function TBrasil4DISBNProviderHelper.ToString: string;
begin
  Result := EmptyStr;
  case Self of
    tpCbl: Result := 'cbl';
    tpMercadoEditorial: Result := 'mercado-editorial';
    tpOpenLibrary: Result := 'open-library';
    tpGoogleBooks: Result := 'google-books';
  end;
end;

end.
