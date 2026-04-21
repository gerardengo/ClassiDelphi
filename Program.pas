unit Program;

interface

uses
  System.SysUtils, 
  System.Classes, 
  System.Generics.Collections, 
  System.JSON;

type
  TPersona = class
  public
    Name: string;
    Age: Integer;
    constructor Create(AName: string; AAge: Integer); 
    function ToJson: TJSONObject; 
  end;

  TStudente = class(TPersona)
  public
    StudentID: string;
    constructor Create(AName: string; AAge: Integer; AStudentID: string);
  end;

  TInsegnante = class(TPersona)
  public
    Subject: string;
    constructor Create(AName: string; AAge: Integer; ASubject: string);
  end;

  TGenitore = class(TPersona)
  public
    ContactNumber: string;
    constructor Create(AName: string; AAge: Integer; AContactNumber: string);
  end;

procedure SaveToFile(const AList: TList<TPersona>; const AFileName: string);
function LoadFromFile(const AFileName: string): TList<TPersona>;

implementation

{ TPersona }

constructor TPersona.Create(AName: string; AAge: Integer);
begin
  Name := AName;
  Age := AAge;
end;

function TPersona.ToJson: TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('Name', Name);
  Result.AddPair('Age', Age);
end;

{ TStudente }

constructor TStudente.Create(AName: string; AAge: Integer; AStudentID: string);
begin
  inherited Create(AName, AAge);
  StudentID := AStudentID;
end;

{ TInsegnante }

constructor TInsegnante.Create(AName: string; AAge: Integer; ASubject: string);
begin
  inherited Create(AName, AAge);
  Subject := ASubject;
end;

{ TGenitore }

constructor TGenitore.Create(AName: string; AAge: Integer; AContactNumber: string);
begin
  inherited Create(AName, AAge);
  ContactNumber := AContactNumber;
end;

procedure SaveToFile(const AList: TList<TPersona>; const AFileName: string);
var
  JsonArray: TJSONArray;
  Persona: TPersona;
  i: Integer;
begin
  JsonArray := TJSONArray.Create;
  try
    for i := 0 to AList.Count - 1 do
    begin
      Persona := AList[i];
      JsonArray.AddElement(Persona.ToJson);
    end;
    TFile.WriteAllText(AFileName, JsonArray.ToJSON);
  finally
    JsonArray.Free;
  end;
end;

function LoadFromFile(const AFileName: string): TList<TPersona>;
begin
  // Implement loading from JSON file
end;

begin
  // Main application logic
end.