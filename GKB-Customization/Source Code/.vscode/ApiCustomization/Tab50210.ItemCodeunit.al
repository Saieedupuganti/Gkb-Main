// Code to Sync Data frombBC to Dynamics by triggering Power Automate using URL

tableextension 50210 "Item Creation Power Automate" extends Item
{

    trigger OnAfterModify()
    var
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
        ResponseText: Text;
        json: JsonObject;
        responsejson: JsonObject;
        jsontext: Text;
        tokenvalue: JsonToken;
        tokenstring: Text;
        uomRec: Record "Unit of Measure";
        unitcrmid: Text;
        unitgroupcrmid: Text;
        vendorRec: Record Vendor;
        vendorid: Text;
        fieldservicetype: Text;
        producttype: Text;
        tradetype: Text;
    begin
        Content.GetHeaders(ContentHeaders);

        if not ContentHeaders.Contains('Content-Type') then
            ContentHeaders.Add('Content-Type', 'application/json');

        if not ContentHeaders.Contains('Content-Encoding') then
            ContentHeaders.Add('Content-Encoding', 'UTF8');

        vendorid := '';
        unitcrmid := '';
        unitgroupcrmid := '';
        fieldservicetype := Format(Rec.Type);
        producttype := Format(Rec."Product Type");

        vendorRec.SetFilter("No.", Rec."Vendor No.");
        if vendorRec.FindFirst() then begin
            if Rec."Vendor No." <> '' then begin
                vendorid := '/accounts(' + vendorRec."CRM ID" + ')';
            end;
        end;
        uomRec.SetFilter(Code, Rec."Base Unit of Measure");
        if uomRec.FindFirst() then begin
            if (uomRec."CRM ID" <> '') then begin
                unitcrmid := '/uoms(' + uomRec."CRM ID" + ')';
            end;
            if (uomRec."Unitgroup CRM ID" <> '') then begin
                unitgroupcrmid := '/uomschedules(' + uomRec."Unitgroup CRM ID" + ')';
            end;
            // unitcrmid:=uomRec."CRM ID";
            // unitgroupcrmid:=uomRec."Unitgroup CRM ID";
        end;

        if fieldservicetype = 'Inventory' then begin
            fieldservicetype := '690970000';
        end else if fieldservicetype = 'Non-Inventory' then begin
            fieldservicetype := '690970001';
        end else if fieldservicetype = 'Service' then begin
            fieldservicetype := '690970002';
        end else begin
            fieldservicetype := '';
        end;

        // if producttype='Sales Inventory' then begin
        //     producttype:='1';
        // end else if producttype='Miscellaneous Charges' then begin
        //     producttype:='2';
        // end else if producttype='Services' then begin
        //     producttype:='3';
        // end else if producttype='Flat Fees' then begin
        //     producttype:='4';
        // end else begin
        //     producttype:='';
        // end;

        if tradetype = 'Service Engineer Dual Trade' then begin
            tradetype := '888880000';
        end else if tradetype = 'First-Year Apprentice' then begin
            tradetype := '888880001';
        end else if tradetype = 'Second-Year Apprenctice' then begin
            tradetype := '888880002';
        end else if tradetype = 'Third-Year Apprenctice' then begin
            tradetype := '888880003';
        end else if tradetype = 'Fourth-Year Apprenctice' then begin
            tradetype := '888880004';
        end else begin
            tradetype := '888880000';
        end;

        json.Add('bcid', Rec."No.");
        json.Add('crmid', Rec."CRM ID");
        json.Add('defaultunitid', unitcrmid);
        json.Add('defaultunitgroupid', unitgroupcrmid);
        json.Add('currencyid', Rec."Currency Id");
        json.Add('name', Rec.Description);
        json.Add('description', Rec.Description);
        json.Add('sapno', Rec."No.");
        json.Add('internalproductname', Rec."OBS Item Name");
        json.Add('postinggroup', Rec."Posting Group");
        json.Add('standardcost', Rec."Standard Cost");
        json.Add('tradetype', tradetype);
        json.Add('type', fieldservicetype);
        json.Add('currentcost', Rec."Unit Cost");
        json.Add('vendorcatalogueno', Rec."Vendor 1 Catalogue Number");
        json.Add('vendorid', vendorid);

        if (Format(Rec."Product Type") <> '') and (Format(Rec."Product Type") <> '0') then begin
            if Format(Rec."Product Type") = ' ' then begin
                json.Add('producttype', '1');
            end else begin
                json.Add('producttype', Rec."Product Type");
            end;

        end else begin
            json.Add('producttype', '1');
        end;

        json.WriteTo(jsontext);
        Content.WriteFrom(jsontext);

        IsSuccessful := Client.Get('https://prod-28.australiasoutheast.logic.azure.com:443/workflows/7b639aebf03d48b589cb0cb4e242a43e/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=CBcPia0oWMebjYN00WLYwLb4Xr-lnSEztYIePQITywc', Response);

        if IsSuccessful then begin
            Response.Content().ReadAs(ResponseText);
            // Message(ResponseText);
            responsejson.ReadFrom(ResponseText);
            if responsejson.Contains('crmid') then begin
                responsejson.Get('crmid', tokenvalue);
                tokenstring := tokenvalue.AsValue().AsText();
                Rec."CRM ID" := Format(tokenstring);
                Rec.modify(false);
            end;
        end;
    end;
}

pageextension 50303 "Item Ext" extends "Item Card"
{

    layout
    {
        addafter("D365 Product ID")
        {
            field("CRM ID"; Rec."CRM ID")
            {
                Caption = 'CRM ID';
                ApplicationArea = All;
            }
        }
    }
}