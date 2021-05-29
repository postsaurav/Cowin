codeunit 60000 "CW Load Setup"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
    begin
        DeleteExistingSetupRecords();
        LoadURL();
    end;

    local procedure DeleteExistingSetupRecords()
    var
        CWStates: Record "Cw States";
        CWDistrict: Record "CW District";
        APIURL: Record "CW Api Url";
        APIURLFields: Record "CW Api Url Fields";
    begin
        CWStates.DeleteAll();
        CWDistrict.DeleteAll();
        APIURL.DeleteAll();
        APIURLFields.DeleteAll();
    end;

    local procedure LoadURL()
    var
        APIURL: Record "CW Api Url";
    begin
        APIURL.INIT;
        APIURL."Entry No." := 1;
        APIURL.URL := 'https://cdn-api.co-vin.in/api/v2/admin/location/states';
        APIURL."URL Keys" := 'states';
        APIURL.Insert();
        LoadURLFields(APIURL."Entry No.");

        APIURL.INIT;
        APIURL."Entry No." := 2;
        APIURL.URL := 'https://cdn-api.co-vin.in/api/v2/admin/location/districts';
        APIURL."URL Keys" := 'districts';
        APIURL.Insert();
        LoadURLFields(APIURL."Entry No.");
    end;

    local procedure LoadURLFields(EntryNo: Integer)
    var
        APIURLFields: Record "CW Api Url Fields";
    begin
        Case EntryNo of
            1:
                begin
                    APIURLFields.Init();
                    APIURLFields."Entry No." := EntryNo;
                    APIURLFields."Field No." := 1;
                    APIURLFields."Field Name" := 'state_id';
                    APIURLFields.Insert();

                    APIURLFields.Init();
                    APIURLFields."Entry No." := EntryNo;
                    APIURLFields."Field No." := 2;
                    APIURLFields."Field Name" := 'state_name';
                    APIURLFields.Insert();
                end;
            2:
                begin
                    APIURLFields.Init();
                    APIURLFields."Entry No." := EntryNo;
                    APIURLFields."Field No." := 1;
                    APIURLFields."Field Name" := 'state_id';
                    APIURLFields.Insert();

                    APIURLFields.Init();
                    APIURLFields."Entry No." := EntryNo;
                    APIURLFields."Field No." := 2;
                    APIURLFields."Field Name" := 'district_id';
                    APIURLFields.Insert();

                    APIURLFields.Init();
                    APIURLFields."Entry No." := EntryNo;
                    APIURLFields."Field No." := 3;
                    APIURLFields."Field Name" := 'district_name';
                    APIURLFields.Insert();
                end;
        end;
    end;
}