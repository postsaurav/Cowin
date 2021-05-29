page 70002 "CW Avail Slots"
{
    ApplicationArea = All;
    Editable = false;
    Caption = 'Avail Slots';
    PageType = List;
    SourceTable = "CW Avail Slot Header";
    UsageCategory = Lists;
    CardPageId = "CW Avail Slot";
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field';
                    ApplicationArea = All;
                }
                field("State Name"; Rec."State Name")
                {
                    ToolTip = 'Specifies the value of the State Name field';
                    ApplicationArea = All;
                }
                field("District Name"; Rec."District Name")
                {
                    ToolTip = 'Specifies the value of the District Name field';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(FetchStates)
            {
                ApplicationArea = All;
                Caption = 'Get States';
                Image = GetLines;
                ToolTip = 'Get States From Cowin WebSite.';
                trigger OnAction()
                var
                    CowinReader: Codeunit "CW Api Reader";
                begin
                    CowinReader.ReadAllStates();
                end;
            }
            action(FetchDistrict)
            {
                ApplicationArea = All;
                Caption = 'Get District';
                Image = GetLines;
                ToolTip = 'Get District From Cowin WebSite.';
                trigger OnAction()
                var
                    CowinReader: Codeunit "CW Api Reader";
                begin
                    CowinReader.ReadAllDistrict();
                end;
            }
        }
    }

}
