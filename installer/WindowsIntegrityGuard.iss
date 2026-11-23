#define MyAppName "Windows Integrity Guard"
#define MyAppVersion "1.0"
#define MyAppPublisher "Felipe Amorim"
#define MyAppExeName "WindowsIntegrityGuard.UI.exe"
#define MyServiceName "WindowsIntegrityGuard"
#define MyServiceDisplayName "Windows Integrity Guard"

[Setup]
AppId={{B1304451-61C5-471E-A445-67F4C28004F5}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}

DefaultDirName={autopf}\Windows Integrity Guard
DefaultGroupName=Windows Integrity Guard

OutputDir=output
OutputBaseFilename=WindowsIntegrityGuard-Setup-{#MyAppVersion}

Compression=lzma2
SolidCompression=yes

PrivilegesRequired=admin
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

WizardStyle=modern

UninstallDisplayName={#MyAppName}

SetupLogging=yes
CloseApplications=yes
RestartApplications=no

[Dirs]
Name: "{app}\UI"
Name: "{app}\Service"

[Files]
Source: "publish\ui\*"; DestDir: "{app}\UI"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "publish\service\*"; DestDir: "{app}\Service"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Windows Integrity Guard"; Filename: "{app}\UI\{#MyAppExeName}"
Name: "{autodesktop}\Windows Integrity Guard"; Filename: "{app}\UI\{#MyAppExeName}"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Criar atalho na Área de Trabalho"; GroupDescription: "Atalhos adicionais:"; Flags: unchecked

[Run]

; Remove instalação anterior do Service caso exista
Filename: "{sys}\sc.exe"; Parameters: "stop ""{#MyServiceName}"""; Flags: runhidden waituntilterminated; Check: ServiceExists

Filename: "{sys}\sc.exe"; Parameters: "delete ""{#MyServiceName}"""; Flags: runhidden waituntilterminated; Check: ServiceExists

; Instala o Service como LocalSystem
Filename: "{sys}\sc.exe"; Parameters: "create ""{#MyServiceName}"" binPath= ""{app}\Service\WindowsIntegrityGuard.Service.exe"" start= auto DisplayName= ""{#MyServiceDisplayName}"""; Flags: runhidden waituntilterminated

; Configura descrição
Filename: "{sys}\sc.exe"; Parameters: "description ""{#MyServiceName}"" ""Monitora e verifica a integridade de arquivos e componentes críticos do Windows."""; Flags: runhidden waituntilterminated

; Reinício após falhas
Filename: "{sys}\sc.exe"; Parameters: "failure ""{#MyServiceName}"" reset= 86400 actions= restart/5000/restart/10000/restart/30000"; Flags: runhidden waituntilterminated

Filename: "{sys}\sc.exe"; Parameters: "failureflag ""{#MyServiceName}"" 1"; Flags: runhidden waituntilterminated

; Inicia Service
Filename: "{sys}\sc.exe"; Parameters: "start ""{#MyServiceName}"""; Flags: runhidden waituntilterminated

; UI
Filename: "{app}\UI\{#MyAppExeName}"; Description: "Executar Windows Integrity Guard"; Flags: nowait postinstall skipifsilent

[UninstallRun]

Filename: "{sys}\sc.exe"; Parameters: "stop ""{#MyServiceName}"""; Flags: runhidden waituntilterminated; RunOnceId: "StopService"

Filename: "{sys}\sc.exe"; Parameters: "delete ""{#MyServiceName}"""; Flags: runhidden waituntilterminated; RunOnceId: "DeleteService"

[Code]

function ServiceExists(): Boolean;
var
  ResultCode: Integer;
begin
  Exec(
    ExpandConstant('{cmd}'),
    '/C sc query "{#MyServiceName}" >nul 2>&1',
    '',
    SW_HIDE,
    ewWaitUntilTerminated,
    ResultCode
  );

  Result := ResultCode = 0;
end;