tableextension 50145 "Gen. Journal Line Extension" extends "Gen. Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50141; "Expense Code"; Code[20])
        {
            TableRelation = Expense.Code WHERE (Disabled = CONST (false));
        }
    }

    var
        myInt: Integer;
}