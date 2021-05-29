codeunit 70000 "CW Api Reader"
{
    procedure ReadAllStates()
    var
        APIURL: Record "CW Api Url";
        ResultsToken: JsonToken;
        SingleResult: JsonToken;

        InputJsonObject: JsonObject;
        ReturnValueToken: JsonToken;

        CWStates: Record "Cw States";
        StateID: Integer;
        StateName: Text;
    begin
        APIURL.GET(1);
        ReturnValueArray(APIURL, APIURL.URL, ResultsToken);

        foreach SingleResult in ResultsToken.AsArray() do begin
            InputJsonObject := SingleResult.AsObject();

            IF InputJsonObject.Get('state_id', ReturnValueToken) then
                StateID := ReturnValueToken.AsValue().AsInteger();
            IF InputJsonObject.Get('state_name', ReturnValueToken) then
                StateName := ReturnValueToken.AsValue().AsText();

            CWStates.Init();
            CWStates.id := StateID;
            CWStates.Name := StateName;
            CWStates.Insert();
        end;
    end;

    procedure ReadAllDistrict()
    var
        APIURL: Record "CW Api Url";
        ResultsToken: JsonToken;
        SingleResult: JsonToken;

        InputJsonObject: JsonObject;
        ReturnValueToken: JsonToken;
        CWStates: Record "Cw States";
        CWDistrict: Record "CW District";
        StateID: Integer;
        DistrictID: Integer;
        DistrictName: Text;
    begin
        APIURL.GET(2);
        IF CWStates.FindSet() then
            repeat
                ReturnValueArray(APIURL, APIURL.URL + '\' + Format(CWStates.id), ResultsToken);
                foreach SingleResult in ResultsToken.AsArray() do begin
                    InputJsonObject := SingleResult.AsObject();
                    //IF InputJsonObject.Get('state_id', ReturnValueToken) then
                    //    StateID := ReturnValueToken.AsValue().AsInteger();
                    IF InputJsonObject.Get('district_id', ReturnValueToken) then
                        DistrictID := ReturnValueToken.AsValue().AsInteger();
                    IF InputJsonObject.Get('district_name', ReturnValueToken) then
                        DistrictName := ReturnValueToken.AsValue().AsText();
                    CWDistrict.Init();
                    CWDistrict."State Id" := CWStates.id;
                    CWDistrict.id := DistrictID;
                    CWDistrict.Name := DistrictName;
                    CWDistrict.Insert();
                end;
            until (CWStates.Next() = 0);
    end;

    local procedure ReturnValueArray(APIURL: Record "CW Api Url"; URL: Text[250]; var ResultsToken: JsonToken)
    var
        URLRequest: HttpClient;
        URLResponse: HttpResponseMessage;
        URLResponseTxt: Text;
        JsonResponses: JsonObject;
    begin
        URLRequest.Get(URL, URLResponse);
        URLResponse.Content.ReadAs(URLResponseTxt);

        IF not JsonResponses.ReadFrom(URLResponseTxt) then
            Error('No Response Returned.');

        if JsonResponses.Contains(APIURL."URL Keys") then
            if not JsonResponses.Get(APIURL."URL Keys", ResultsToken) then
                Error('No %1 found', APIURL."URL Keys");
    end;
}