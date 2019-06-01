unit uVisualizarDados;


interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.JSON,  System.Generics.Collections,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls,
  FMX.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Dapt, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TLayoutHelper = class helper for TLayout
    procedure GridJson(JSON :String);
    procedure GridSQL(SQL :String);
end;

implementation

{ TLayoutHelper }

procedure TLayoutHelper.GridJson(JSON: String);
var
   JSONValue,JSONValue2 : TJSONValue;
   JSONArray,JSONArray2 : TJSONArray;
   JSONObject,JSONObject2 : TJSONObject;
   Loop1, Loop2 , Loop3, Loop4 : Integer;
begin

   try
      JSONValue := TJSONObject.ParseJSONValue(JSON);

      {garantir que seja um JSONArray}
      if (JSONValue is TJSONObject) then begin
        FreeAndNil(JSONValue);
        JSONValue := TJSONObject.ParseJSONValue('['+JSON+']');
      end;

      if (JSONValue is TJSONArray) then begin
         try
            JSONArray := TJsonObject.ParseJSONValue(JSONValue.ToJSON) as TJSONArray;
            //Criar um VertScrollBox

            for Loop1 := 0 to JSONArray.Count - 1 do begin
               try
                  //Criar um TLayout para cada objeto do Array

                  //Criar um TRectangle para cada objeto do Array

                  JSONObject := TJSONObject.ParseJSONValue(JsonArray.Items[Loop1].ToJSON) as TJSONObject;
                  for Loop2 := 0 to JSONObject.count-1 do begin

                     try
                        JSONValue2 := TJSONObject.ParseJSONValue(jsonObject.Pairs[Loop2].JsonValue.ToJSON);
                        if (JSONValue2 is TJSONArray) then begin
                           try
                              JSONArray2 := TJSONObject.ParseJSONValue(JSONValue2.ToJSON) as TJSONArray; ;
                              //Incrementar Altura do TLayout

                              for Loop3 := 0 to JSONArray2.Count - 1 do begin
                                 //Criar um TRectangle para cada objeto do Array

                                 try
                                    JSONObject2 := TJSONObject.ParseJSONValue(JsonArray2.Items[Loop3].ToJSON) as TJSONObject;
                                    for Loop4 := 0 to JSONObject2.count-1 do begin
                                        //Criar os campos no Detalhes
                                    end;

                                 finally
                                    JSONObject2.Free;
                                 end;

                              end;

                           finally
                              JSONArray2.Free;
                           end;

                        end else begin
                           // criar os campos no cabeçalho
                          
                        end;
                     finally
                        JSONValue2.Free;
                     end;
                  end;

               finally
                 jsonObject.Free;
               end;
            end;

         finally
            JSONArray.Free;
         end;

      end;


   finally

     JSONValue.Free;

   end;



end;

procedure TLayoutHelper.GridSQL(SQL: String);
begin

end;

end.

