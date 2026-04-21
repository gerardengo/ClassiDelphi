// GestionePersone.dpr

program GestionePersone;

uses
  SysUtils,
  Classes,
  StrUtils,
  // Additional required units
  // Add the JSON processing unit to handle persistence
  System.JSON;

var
  // Declare necessary variables
  FilePath: string;
  DataList: TList<string>;

procedure LoadData;
var
  JsonData: TJSONObject;
  FileStream: TFileStream;
begin
  // Load data from JSON file
  if FileExists(FilePath) then
  begin
    FileStream := TFileStream.Create(FilePath, fmOpenRead);
    try
      JsonData := TJSONObject.ParseFromStream(FileStream) as TJSONObject;
      // Process JsonData to load your data into DataList
    finally
      FileStream.Free;
    end;
  end;
end;

procedure SaveData;
var
  JsonData: TJSONObject;
  FileStream: TFileStream;
begin
  // Create JSON object and fill it with current data
  JsonData := TJSONObject.Create;
  try
    // Populate JsonData from DataList
    // Save the JsonData to a file
    FileStream := TFileStream.Create(FilePath, fmCreate);
    try
      JsonData.SaveToStream(FileStream);
    finally
      FileStream.Free;
    end;
  finally
    JsonData.Free;
  end;
end;

begin
  FilePath := 'data.json'; // Define your data file path

  // Load data on startup
  LoadData;

  // Main program logic here

  // Save data on exit
  SaveData;
end.