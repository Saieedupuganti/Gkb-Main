pageextension 50156  GKBBlanketPoExt extends "Blanket Purchase Order" 
{
    layout
    {
        modify("Prices Including VAT")
        {
            Caption = 'Prices Including GST';
        }
        modify("VAT Bus. Posting Group")
        {
            Caption = 'GST Bus. Posting Group';
        }

    }
    
}






