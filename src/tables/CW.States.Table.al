table 70000 "Cw States"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;
    fields
    {
        field(1; id; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; id)
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

    procedure LookupStates(var States: Record "Cw States"): Boolean
    var
        Result: Boolean;
        StateLookup: Page "CW States";
    begin
        StateLookup.SETTABLEVIEW(States);
        StateLookup.SETRECORD(States);
        StateLookup.LOOKUPMODE := TRUE;
        Result := StateLookup.RUNMODAL = ACTION::LookupOK;
        IF Result THEN
            StateLookup.GETRECORD(States)
        ELSE
            CLEAR(States);
        EXIT(Result);
    end;
}
