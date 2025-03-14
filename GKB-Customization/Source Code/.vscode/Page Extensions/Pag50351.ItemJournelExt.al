pageextension 50351 "Item Journel Ext" extends "Item Journal"
{
    layout
    {
        addafter("Shortcut Dimension 1 Code")
        {
            field(Comment; Rec.Comment)
            {
                ApplicationArea = All;
                Caption = 'Comment';
            }
        }
        modify("Location Code")
        {
            ShowMandatory = true;

        }
        addafter("Location Code")
        {
            field("Item Availability By Location"; Rec."Item Availability By Location")
            {
                ApplicationArea = all;
                ToolTip = 'Shows the Item availibilty by Location Code';
            }
        }
    }
    actions
    {
        // modify(Post)
        // {
        //     trigger OnBeforeAction()           // If the Location is QLD, NSW and WA then Obrien Business Ubit Code is Mandotory. If any other value no need
        //     var
        //         SpecialLocationCodes: List of [Text];
        //         Location: Record Location;
        //     begin
        //         if Rec.IsTemporary then
        //             exit;

        //         Location.SetRange(Code, rec."Location Code");
        //         if Location.FindFirst then begin
        //             SpecialLocationCodes.Add(Location.Name);
        //         end;
        //         if SpecialLocationCodes.Contains('NSW')  then begin
        //             if Rec."Shortcut Dimension 1 Code" = '' then
        //                 Error('Obrien Business Unit Code is mandatory when Location Code is %1', Location.Name);
        //         end;
        //     end;

        // }
        modify(Post)
        {
            trigger OnBeforeAction()           // If the Location is QLD, NSW and VIC then Obrien Business Unit Code is Mandatory. If any other value no need
            var
                Location: Record Location;
            begin
                if Rec.IsTemporary then
                    exit;

                Location.SetRange(Code, rec."Location Code");
                if Location.FindFirst then begin
                    if (Location.Name.Contains('NSW') or Location.Name.Contains('QLD') or Location.Name.Contains('VIC') or Location.Name.Contains('WA')) then begin
                        if Rec."Shortcut Dimension 1 Code" = '' then
                            Error('Obrien Business Unit Code is mandatory for the Location: %1', Location.Name);
                    end;
                end;
            end;
        }
    }
}