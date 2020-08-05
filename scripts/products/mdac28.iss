[CustomMessages]
mdac28_title=Microsoft Data Access Components 2.8

mdac28_size=5 MB

[Code]
const
	mdac28_url = 'http://download.microsoft.com/download/c/d/f/cdfd58f1-3973-4c51-8851-49ae3777586f/MDAC_TYP.EXE';

procedure mdac28(minVersion: String);
var
	version: String;
begin
	// check for MDAC installation
	RegQueryStringValue(HKLM, 'Software\Microsoft\DataAccess', 'FullInstallVer', version);
	if (compareversion(version, minVersion) < 0) then
		AddProduct('mdac28.exe',
			'/q:a /c:"install /qb /l"',
			CustomMessage('mdac28_title'),
			CustomMessage('mdac28_size'),
			mdac28_url,
			false, false, false);
end;

[Setup]
