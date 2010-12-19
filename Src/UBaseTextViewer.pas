{
 * UBaseTextViewer.pas
 *
 * Implements a base class for all viewers that read text from the clipboard.
 * Provides access to text on clipboard.
 *
 * v1.0 of 09 Mar 2008  - Original version.
 *
 *
 * ***** BEGIN LICENSE BLOCK *****
 *
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with the
 * License. You may obtain a copy of the License at http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
 * the specific language governing rights and limitations under the License.
 *
 * The Original Code is UBaseTextViewer.pas.
 *
 * The Initial Developer of the Original Code is Peter Johnson
 * (http://www.delphidabbler.com/).
 *
 * Portions created by the Initial Developer are Copyright (C) 2008 Peter
 * Johnson. All Rights Reserved.
 *
 * Contributor(s): None
 *
 * ***** END LICENSE BLOCK *****
}


unit UBaseTextViewer;


interface


uses
  // Project
  UGlobalMemViewer;


type

  {
  TBaseTextViewer:
    Base class for all viewers that read text from the clipboard. Provides
    access to text on clipboard.
  }
  TBaseTextViewer = class(TGlobalMemViewer)
  protected
    function CopyClipboardText(const FmtID: Word): string;
      {Makes a copy of textual clipboard data and returns it as text. Text can
      be either Ansi or Unicode.
        @param FmtID [in] Required clipboard format.
        @return Required text.
      }
  end;


implementation


uses
  // Delphi
  SysUtils,
  // Project
  UDataBuffer, UTextTypeSniffer;


{ TBaseTextViewer }

function TBaseTextViewer.CopyClipboardText(const FmtID: Word): string;
  {Makes a copy of textual clipboard data and returns it as text. Text can be
  either Ansi or Unicode.
    @param FmtID [in] Required clipboard format.
    @return Required text.
  }
var
  Data: IDataBuffer;          // data buffer containing copy of clipboard data
  Buffer: Pointer;            // pointer into data buffer
  Sniffer: TTextTypeSniffer;  // used to test whether text is Unicode or ANSI
begin
  // Take copy of clipboard data
  // NOTE: Three copies of clipboard text exist during this method, which is
  // inefficient. 1st is copy on clipboard, second is copy in data buffer and
  // third is text in result string. Data buffer is freed at the end of the
  // method. If this proves too much overhead then bypass CopyClipboardData
  // and hold clipboard open while reading text.
  Data := CopyClipboardMemData(FmtID);
  // Create sniffer object to check whether data is Unicode or Ansi text
  Sniffer := TTextTypeSniffer.Create(Data);
  try
    // Get data in correct format
    Buffer := Data.Lock;
    try
      if Sniffer.IsUnicode then
        Result := PWideChar(Buffer) // Unicode: convert back to string
      else
        Result := PChar(Buffer);    // Ansi: just return it
    finally
      Data.Unlock;
    end;
  finally
    FreeAndNil(Sniffer);
  end;
end;

end.
