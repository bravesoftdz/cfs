Clipboard Format Spy Source Code Readme
================================================================================

Source code for the current version of DelphiDabbler Clipboard Format Spy is
always available from http://www.delphidabbler.com/download?id=cfs&type=src.

Clipboard Format Spy's source code is provided in a zip file, `dd-cfs-src.zip`.
This file includes all Clipboard Format Spy's original code along with some 3rd
party sources. Files should be extracted from the zip file and the directory
structure should be preserved.

The directory structure is:

    Bin        : Binary resource files (*1)
    Src        : Pascal & other source code + batch file controlling build (*2)
      3rdParty : Supplied 3rd party source code
      Help     : Source files for the CFS.chm HTML Help file (*3)
        CSS    : Cascading style sheet used by HTML Help file
        HTML   : HTML source documents for HTML help topics
        Images : GIF files used by HTML help file
      Res      : Contains assets that are compiled into resources

Notes:

1. See below for details of how to recompile these files.
2. Build batch file described below.
3. Files generated by Microsoft HTML Help Workshop.

In order to compile the program you also need to create a `Exe` directory at the
same level as the `Bin` and `Src` directories.

Additional libraries / components are required to compile Clipboard Format Spy
successfully. They are:

* From DelphiDabbler.com:
    * Version Information Component (v3.3 or later)
    * Window State Components (v5.3.1 or later)
    * Clipboard Viewer Component (v1.4 or later)
    * Hot Label Component (v2.1.1 or later)
* The Delphi 2010 VCL.

All the libraries need to be available on Delphi's library path.

All components must be installed in the Delphi Component Palette if the program
is to be compiled from the IDE.

The program also requires two binary files in order to compile (provided):

* `Version.res` - The program's version information.
* `Resources.res` - All other resources including main program icon, default CSS
  for HTML viewer and manifest for XP and Vista.


Build Tools
--------------------------------------------------------------------------------

A batch file - `Build.bat` - is provided in the `Src` directory. It can be used
to automate full or partial builds. It must be called with a command line
switch. Switches are:

* `all` - Builds everything.
* `res` - Builds binary resource files only. Requires VIEd and BRCC32. Creates
  `Version.res` and `Resources.res` from `Version.vi` and `Resources.rc`
  respectively.
* `pas` - Builds the Delphi Pascal project. Requires DCC32.
* `exe` - Builds program executable from resource and Pascal files. Same as
   `Build res` followed by `Build pas`.
* `help` - Builds the HTML help file. Requires HHC.
* `setup` - Builds the install program. Requires ISC. Creates installer from
  `Install.iss`.

The programs required by the build process are:

* `VIEd` - DelphiDabbler Version Information Editor, available from
  www.delphidabbler.com. Requires v2.11 or later.
* `BRCC32` - Borland Resource Compiler, supplied with Delphi 2010.
* `DCC32` - Delphi Command Line Compiler, supplied with Delphi 2010.
* `HHC`- Microsoft HTML Help Compiler, supplied with Microsoft HTML Help
  Workshop.
* `ISC` - Inno Setup command line compiler, supplied with Inno Setup v5. Also
  requires the ISPP pre-processor v5. The Unicode version of Inno Setup is
  required.


Licensing
--------------------------------------------------------------------------------

Please see `SourceCodeLicenses.txt` in the Docs directory for information about
source code licenses.


Earlier Versions
--------------------------------------------------------------------------------

If you would like the source code of earlier, publicly released, versions of
Clipboard Format Spy, please contact me via http://delphidabbler.com/contact
specifying the version you would like source code for. See the change log at
http://delphidabbler.com/software/cfs/changelog for details of available
versions.

Please note: source code for versions before v4.0.0 are no longer available.

--------------------------------------------------------------------------------

    $Rev$
    $Date$

