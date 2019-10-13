pageextension 50107 "Customer Update" extends "Customer Card"
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
        Text90001: Text[100];
        Text90002: Text[100];
        Text90003: Text[100];

    procedure CallUpdateCreditLimit();
    var
        CreditLimitCalculated: Decimal;
        CreditLimitActual: Decimal;
    begin
        Text90001 := 'Are you sure that you want to set the %1 to %2';
        Text90002 := 'The credit limit was rounded to %1 to comply with company policies.';
        Text90003 := 'The credit limit is up to date.';
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