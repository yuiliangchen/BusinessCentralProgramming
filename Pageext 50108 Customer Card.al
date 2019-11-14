pageextension 50108 "Customer Card Extension" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(Processing)
        {
            action(UpdateCreditLimit)
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = CalculateCost;
                ApplicationArea = All;
                Caption = 'Update Credit Limit';
                trigger OnAction();
                begin
                    CallUpdateCreditLimit();
                end;
            }
        }
    }

    var
        myInt: Integer;
        Text90001: Label 'Are you sure that you want to set the %1 to %2', Comment = 'Foo', MaxLength = 999, Locked = true;
        Text90002: Label 'The credit limit was rounded to %1 to comply with company policies.', Comment = 'Foo', MaxLength = 999, Locked = true;
        Text90003: Label 'The credit limit is up to date.', Comment = 'Foo', MaxLength = 999, Locked = true;
    //        Text90001: TextConst ENU = 'Are you sure that you want to set the %1 to %2';
    //        Text90002: TextConst ENU = 'The credit limit was rounded to %1 to comply with company policies.';
    //        Text90003: TextConst ENU = 'The credit limit is up to date.';

    local procedure CallUpdateCreditLimit();
    var
        CreditLimitCalculated: Decimal;
        CreditLimitActual: Decimal;
    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit;
        IF CreditLimitCalculated = Rec."Credit Limit (LCY)" THEN BEGIN
            MESSAGE(Text90003);
            EXIT;
        END;
        IF GUIALLOWED AND NOT CONFIRM(Text90001, FALSE, FIELDCAPTION("Credit Limit (LCY)"), CreditLimitCalculated) THEN
            EXIT;
        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
        IF CreditLimitActual <> CreditLimitCalculated THEN
            MESSAGE(Text90002, CreditLimitActual);
    end;
}