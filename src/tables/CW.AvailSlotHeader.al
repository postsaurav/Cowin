table 70002 "CW Avail Slot Header"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; "State ID"; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = "Cw States";
        }
        field(3; "State Name"; Text[250])
        {
            DataClassification = CustomerContent;
            TableRelation = "Cw States".Name;

            trigger OnLookup()
            var
                States: Record "Cw States";
            begin
                IF "State ID" <> 0 then
                    States.Get(Rec."State ID");
                If States.LookupStates(States) then begin
                    "State Name" := States.Name;
                    Validate("State ID", States.id);
                end;
            end;
        }
        field(4; "Pin Code"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(5; "District ID"; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = "CW District" where("State Id" = field("State ID"));
        }
        field(6; "District Name"; Text[250])
        {
            DataClassification = CustomerContent;
            TableRelation = "CW District".Name where("State Id" = field("State ID"));
            trigger OnLookup()
            var
                District: Record "Cw District";
            begin
                IF "District ID" <> 0 then
                    District.Get(Rec."State ID", Rec."District ID");

                District.SetRange("State Id", Rec."State ID");
                If District.LookupDistrict(District) then begin
                    "District Name" := District.Name;
                    Validate("District ID", District.id);
                end;
            end;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}