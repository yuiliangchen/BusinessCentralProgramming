tableextension 50107 "Customer Extension" extends Customer
{
    fields
    {
        // Add changes to table fields here
    }
    procedure UpdateCreditLimit(NewCreditLimit: Decimal);
    begin
        NewCreditLimit := ROUND(NewCreditLimit, 10000);
        Rec.VALIDATE("Credit Limit (LCY)", NewCreditLimit);
        Rec.MODIFY;
    end;

    procedure CalculateCreditLimit(): Decimal;
    var
        Cust: Record Customer;
    begin
        Cust := Rec;
        Cust.SETRANGE("Date Filter", CALCDATE('<-12M>', WORKDATE), WORKDATE);
        Cust.CALCFIELDS("Sales (LCY)", "Balance (LCY)");
        EXIT(ROUND(Cust."Sales (LCY)" * 0.5));
    end;
}