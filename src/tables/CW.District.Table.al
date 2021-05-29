table 70001 "CW District"
{
    DataClassification = CustomerContent;
    DataPerCompany = false;
    fields
    {
        field(1; "State Id"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; "id"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Name"; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "State Id", id)
        {
            Clustered = true;
        }
        key(SK; Name)
        { }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Name) { }
        fieldgroup(Brick; Name) { }
    }

    procedure LookupDistrict(var District: Record "CW District"): Boolean
    var
        Result: Boolean;
        DistrictLookup: Page "CW District";
    begin
        DistrictLookup.SETTABLEVIEW(District);
        DistrictLookup.SETRECORD(District);
        DistrictLookup.LOOKUPMODE := TRUE;
        Result := DistrictLookup.RUNMODAL = ACTION::LookupOK;
        IF Result THEN
            DistrictLookup.GETRECORD(District)
        ELSE
            CLEAR(District);
        EXIT(Result);
    end;
}