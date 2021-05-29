page 70003 "CW Avail Slot"
{
    Caption = 'Avail Slot';
    PageType = Card;
    SourceTable = "CW Avail Slot Header";
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field';
                    ApplicationArea = All;
                }
                field("State ID"; Rec."State ID")
                {
                    ToolTip = 'Specifies the value of the State ID field';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("State Name"; Rec."State Name")
                {
                    ToolTip = 'Specifies the value of the State Name field';
                    ApplicationArea = All;
                }
                field("District ID"; Rec."District ID")
                {
                    ToolTip = 'Specifies the value of the District ID field';
                    ApplicationArea = All;
                }
                field("District Name"; Rec."District Name")
                {
                    ToolTip = 'Specifies the value of the District Name field';
                    ApplicationArea = All;
                }
                field("Pin Code"; Rec."Pin Code")
                {
                    ToolTip = 'Specifies the value of the Pin Code field';
                    ApplicationArea = All;
                }
            }
        }
    }
}
