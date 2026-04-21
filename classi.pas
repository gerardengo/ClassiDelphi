unit Classi;

interface

type
  // Interfaccia comune per persone
  IPersona = interface
    ['{12345678-1234-1234-1234-123456789012}']
    function GetNome: string;
    procedure SetNome(const Value: string);
    function GetCognome: string;
    procedure SetCognome(const Value: string);
    function GetDataNascita: TDate;
    procedure SetDataNascita(const Value: TDate);
    function GetEmail: string;
    procedure SetEmail(const Value: string);
    function GetDettagli: string;
    property Nome: string read GetNome write SetNome;
    property Cognome: string read GetCognome write SetCognome;
    property DataNascita: TDate read GetDataNascita write SetDataNascita;
    property Email: string read GetEmail write SetEmail;
  end;

  // Interfaccia per Studente
  IStudente = interface(IPersona)
    ['{87654321-4321-4321-4321-210987654321}']
    function GetMatricola: string;
    procedure SetMatricola(const Value: string);
    function GetClasse: string;
    procedure SetClasse(const Value: string);
    function GetMedia: Double;
    procedure SetMedia(const Value: Double);
    property Matricola: string read GetMatricola write SetMatricola;
    property Classe: string read GetClasse write SetClasse;
    property Media: Double read GetMedia write SetMedia;
  end;

  // Interfaccia per Insegnante
  IInsegnante = interface(IPersona)
    ['{AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE}']
    function GetMateria: string;
    procedure SetMateria(const Value: string);
    function GetStipendio: Double;
    procedure SetStipendio(const Value: Double);
    function GetAnniServizio: Integer;
    procedure SetAnniServizio(const Value: Integer);
    property Materia: string read GetMateria write SetMateria;
    property Stipendio: Double read GetStipendio write SetStipendio;
    property AnniServizio: Integer read GetAnniServizio write SetAnniServizio;
  end;

  // Interfaccia per Genitore
  IGenitore = interface(IPersona)
    ['{BBBBBBBB-CCCC-DDDD-EEEE-AAAAAAAAAAAA}']
    function GetProfessione: string;
    procedure SetProfessione(const Value: string);
    function GetTelefono: string;
    procedure SetTelefono(const Value: string);
    function GetMatricolaFiglio: string;
    procedure SetMatricolaFiglio(const Value: string);
    property Professione: string read GetProfessione write SetProfessione;
    property Telefono: string read GetTelefono write SetTelefono;
    property MatricolaFiglio: string read GetMatricolaFiglio write SetMatricolaFiglio;
  end;

  // Classe TPersona
  TPersona = class(TInterfacedObject, IPersona)
  private
    FNome: string;
    FCognome: string;
    FDataNascita: TDate;
    FEmail: string;
    function GetNome: string;
    procedure SetNome(const Value: string);
    function GetCognome: string;
    procedure SetCognome(const Value: string);
    function GetDataNascita: TDate;
    procedure SetDataNascita(const Value: TDate);
    function GetEmail: string;
    procedure SetEmail(const Value: string);
  public
    function GetDettagli: string; virtual;
    property Nome: string read GetNome write SetNome;
    property Cognome: string read GetCognome write SetCognome;
    property DataNascita: TDate read GetDataNascita write SetDataNascita;
    property Email: string read GetEmail write SetEmail;
  end;

  // Classe TStudente
  TStudente = class(TPersona, IStudente)
  private
    FMatricola: string;
    FClasse: string;
    FMedia: Double;
    function GetMatricola: string;
    procedure SetMatricola(const Value: string);
    function GetClasse: string;
    procedure SetClasse(const Value: string);
    function GetMedia: Double;
    procedure SetMedia(const Value: Double);
  public
    function GetDettagli: string; override;
    property Matricola: string read GetMatricola write SetMatricola;
    property Classe: string read GetClasse write SetClasse;
    property Media: Double read GetMedia write SetMedia;
  end;

  // Classe TInsegnante
  TInsegnante = class(TPersona, IInsegnante)
  private
    FMateria: string;
    FStipendio: Double;
    FAnniServizio: Integer;
    function GetMateria: string;
    procedure SetMateria(const Value: string);
    function GetStipendio: Double;
    procedure SetStipendio(const Value: Double);
    function GetAnniServizio: Integer;
    procedure SetAnniServizio(const Value: Integer);
  public
    function GetDettagli: string; override;
    property Materia: string read GetMateria write SetMateria;
    property Stipendio: Double read GetStipendio write SetStipendio;
    property AnniServizio: Integer read GetAnniServizio write SetAnniServizio;
  end;

  // Classe TGenitore
  TGenitore = class(TPersona, IGenitore)
  private
    FProfessione: string;
    FTelefono: string;
    FMatricolaFiglio: string;
    function GetProfessione: string;
    procedure SetProfessione(const Value: string);
    function GetTelefono: string;
    procedure SetTelefono(const Value: string);
    function GetMatricolaFiglio: string;
    procedure SetMatricolaFiglio(const Value: string);
  public
    function GetDettagli: string; override;
    property Professione: string read GetProfessione write SetProfessione;
    property Telefono: string read GetTelefono write SetTelefono;
    property MatricolaFiglio: string read GetMatricolaFiglio write SetMatricolaFiglio;
  end;

implementation

{ TPersona }

function TPersona.GetNome: string;
begin
  Result := FNome;
end;

procedure TPersona.SetNome(const Value: string);
begin
  FNome := Value;
end;

function TPersona.GetCognome: string;
begin
  Result := FCognome;
end;

procedure TPersona.SetCognome(const Value: string);
begin
  FCognome := Value;
end;

function TPersona.GetDataNascita: TDate;
begin
  Result := FDataNascita;
end;

procedure TPersona.SetDataNascita(const Value: TDate);
begin
  FDataNascita := Value;
end;

function TPersona.GetEmail: string;
begin
  Result := FEmail;
end;

procedure TPersona.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

function TPersona.GetDettagli: string;
begin
  Result := Format('Nome: %s, Cognome: %s, Data Nascita: %s, Email: %s',
    [FNome, FCognome, DateToStr(FDataNascita), FEmail]);
end;

{ TStudente }

function TStudente.GetMatricola: string;
begin
  Result := FMatricola;
end;

procedure TStudente.SetMatricola(const Value: string);
begin
  FMatricola := Value;
end;

function TStudente.GetClasse: string;
begin
  Result := FClasse;
end;

procedure TStudente.SetClasse(const Value: string);
begin
  FClasse := Value;
end;

function TStudente.GetMedia: Double;
begin
  Result := FMedia;
end;

procedure TStudente.SetMedia(const Value: Double);
begin
  FMedia := Value;
end;

function TStudente.GetDettagli: string;
begin
  Result := inherited GetDettagli + Format(', Matricola: %s, Classe: %s, Media: %.2f',
    [FMatricola, FClasse, FMedia]);
end;

{ TInsegnante }

function TInsegnante.GetMateria: string;
begin
  Result := FMateria;
end;

procedure TInsegnante.SetMateria(const Value: string);
begin
  FMateria := Value;
end;

function TInsegnante.GetStipendio: Double;
begin
  Result := FStipendio;
end;

procedure TInsegnante.SetStipendio(const Value: Double);
begin
  FStipendio := Value;
end;

function TInsegnante.GetAnniServizio: Integer;
begin
  Result := FAnniServizio;
end;

procedure TInsegnante.SetAnniServizio(const Value: Integer);
begin
  FAnniServizio := Value;
end;

function TInsegnante.GetDettagli: string;
begin
  Result := inherited GetDettagli + Format(', Materia: %s, Stipendio: %.2f, Anni Servizio: %d',
    [FMateria, FStipendio, FAnniServizio]);
end;

{ TGenitore }

function TGenitore.GetProfessione: string;
begin
  Result := FProfessione;
end;

procedure TGenitore.SetProfessione(const Value: string);
begin
  FProfessione := Value;
end;

function TGenitore.GetTelefono: string;
begin
  Result := FTelefono;
end;

procedure TGenitore.SetTelefono(const Value: string);
begin
  FTelefono := Value;
end;

function TGenitore.GetMatricolaFiglio: string;
begin
  Result := FMatricolaFiglio;
end;

procedure TGenitore.SetMatricolaFiglio(const Value: string);
begin
  FMatricolaFiglio := Value;
end;

function TGenitore.GetDettagli: string;
begin
  Result := inherited GetDettagli + Format(', Professione: %s, Telefono: %s, Matricola Figlio: %s',
    [FProfessione, FTelefono, FMatricolaFiglio]);
end;

end.
